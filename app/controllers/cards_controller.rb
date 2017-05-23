class CardsController < ApplicationController

  respond_to :json
 # before_action :card_params, only: [:create, :show, :edit, :update, :destroy]
 # before_action :article_params, only: [:create]

  def index
    #  @events = CEvent.where(start: params[:start]..params[:end])
    #@c_events = CEvent.all
    respond_to do |format|
      format.json { render json: Article.where(site: params[:site])}
    end
  end


  def booking

  end

  def counterUp
    @article = Article.find(params[:id])
    count = @article.count
    @article.count = count + 1
    @article.save
  end

  def counterDown
    @article = Article.find(params[:id])
    count = @article.count
    @article.count = count - 1
    @article.save
  end

  def show
    respond_to do |format|
      #     format.json { render json: Member.where( event_id: params[:id]) }
    end
  end

  def new
    @card = Card.new
  end

  def edit
  end

  def create
    @card = Card.new
    @newPerson = Person.new
    @newPerson.name = person_params[:name]
    @newPerson.vorname = person_params[:vorname]
    @newPerson.einrichtung = person_params[:einrichtung]
    @newPerson.adresse = person_params[:adresse]
    @newPerson.ort = person_params[:ort]
    @newPerson.email = person_params[:email]

    if person_params[:nameR] != ""
      @newPerson.nameR = person_params[:nameR]
    else
      @newPerson.nameR = @newPerson.name
    end
    if person_params[:vornameR] != ""
      @newPerson.vornameR = person_params[:vornameR]
    else
      @newPerson.vornameR = @newPerson.vorname
    end
    if person_params[:einrichtungR] != ""
      @newPerson.einrichtungR = person_params[:einrichtungR]
    else
      @newPerson.einrichtungR = @newPerson.einrichtung
    end
    if person_params[:adresseR] != ""
      @newPerson.adresseR = person_params[:adresseR]
    else
      @newPerson.adresseR = @newPerson.adresse
    end
    if person_params[:ortR] != ""
      @newPerson.ortR = person_params[:ortR]
    else
      @newPerson.ortR = @newPerson.ort
    end
    if person_params[:emailR] != ""
      @newPerson.emailR = person_params[:emailR]
    else
      @newPerson.emailR = @newPerson.email
    end
    if @newPerson.save

#        format.json { render :index, status: :created, location: @news }
    else

    end

    @card.person = @newPerson
    @sum = 0
    #puts(params[:articles].to_s)
    #articleParam.require(:article).permit(:id, :name, :price)
    #puts(card_params[:articles].to_s)
    person_params[:articles].each do |a|
    #  puts(a[:id])
      @article = Article.find(a[:id])

    #  puts(@article)
      if a[:anzahl] > 1
        a[:anzahl].times do |i|
          @card.articles << @article
        end
      else
        @card.articles << @article
      end

      @sum = @sum + a[:sum]
      @article.count = @article.count - a[:anzahl]
      @article.save
   #   @localArticle.add(Article.find(a.id))
    end
    @card.sum = @sum


    # TODO Tests
    # @c_event.userMail = current_user.email

    if @card.save
      BookingMailer.booking_email(@newPerson, params[:articles], @card).deliver
      BookingMailer.booking_new(@newPerson, params[:articles], @card).deliver
#        format.json { render :index, status: :created, location: @news }
      flash[:success] = "Sie haben Ihre Artikel erfolgreich bestellt."
    else
      respond_to  do |f|
        f.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end


  end

  def update
    @card.update(card_params)
  end

  def destroy
    @card.destroy
  end

  private

  def set_article
    @card = Card.find(params[:id])
  end

  def person_params
    params.require(:newPerson).permit(:name, :vorname, :dienststelle, :adresse, :ort, :email, :nameR, :vornameR, :dienstelleR, :ortR, :articles)

  end

  def card_params
    params.require(:card).permit(:articles => [:id, :title, :price, :count, :anzahl, :sum])

  end

  def article_params
    params[:card].require(:articles).permit(:id, :title, :price, :count, :anzahl, :sum)
  end
end