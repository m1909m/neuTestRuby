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

    @newPerson.adresse = person_params[:adresse]
    @newPerson.ort = person_params[:ort]
    @newPerson.email = person_params[:email]
    @newPerson.phone = person_params[:phone]

    @newPerson.dienststelle = person_params[:dienststelle]
    @newPerson.adresseD = person_params[:adresseD]
    @newPerson.ortD = person_params[:ortD]
    @newPerson.emailD = person_params[:emailD]
    @newPerson.phoneD = person_params[:phoneD]
    @newPerson.bestell = person_params[:bestell]

    if params[:switch] == 'privat'
      @newPerson.nameR = person_params[:name]
      @newPerson.vornameR = person_params[:vorname]
      @newPerson.dienststelleR = "Privatperson"
      @newPerson.adresseR = person_params[:adresse]
      @newPerson.ortR = person_params[:ort]
      @newPerson.emailR = person_params[:email]
    elsif params[:switch] == 'dienst'
      @newPerson.nameR = person_params[:name]
      @newPerson.vornameR = person_params[:vorname]
      @newPerson.dienststelleR = person_params[:dienststelle]
      @newPerson.adresseR = person_params[:adresseD]
      @newPerson.ortR = person_params[:ortD]
      @newPerson.emailR = person_params[:emailD]
    elsif params[:switch] == 'rechnung'
      @newPerson.nameR = person_params[:nameR]
      @newPerson.vornameR = person_params[:vornameR]
      @newPerson.dienststelleR = person_params[:dienststelleR]
      @newPerson.adresseR = person_params[:adresseR]
      @newPerson.ortR = person_params[:ortR]
      @newPerson.emailR = person_params[:emailR]
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
    @articles = params[:articles]
    @articles = @articles.delete '/\\'
  #  @articles = @articles.gsub(/["]/, "'")
  #  puts(@articles)
    @jsonArticles = JSON.parse @articles
  #  puts(@jsonArticles)
    @jsonArticles.each do |a|
    #  puts("AAAAid")
    #  puts(a['id'])
    #  puts("-----------------")
      @article = Article.find(a['id'])

    #  puts(@article)
      if a['anzahl'] > 1
        a['anzahl'].times do |i|
          @card.articles << @article
        end
      else
        @card.articles << @article
      end

      @sum = @sum + a['sum']
      @article.count = @article.count - a['anzahl']
      @article.save
   #   @localArticle.add(Article.find(a.id))
    end
    @card.sum = @sum


    # TODO Tests
    # @c_event.userMail = current_user.email

    if @card.save
      BookingMailer.booking_email(@newPerson, @jsonArticles, @card).deliver
      BookingMailer.booking_new(@newPerson, @jsonArticles, @card).deliver
#        format.json { render :index, status: :created, location: @news }
      flash[:success] = "Sie haben Ihre Artikel erfolgreich bestellt."
      session["warenkorb"] = nil
      redirect_to "/warenkorb"

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
    params.require(:newPerson).permit(:gender, :name, :vorname, :adresse, :ort, :email, :phone, :dienststelle, :adresseD, :ortD, :emailD, :phoneD, :bestell, :nameR, :vornameR, :dienststelleR, :adresseR, :ortR, :emailR, :@articles, :articles)

  end

  def card_params
    params.require(:card).permit(:articles => [:id, :title, :price, :count, :anzahl, :sum])

  end

  def article_params
    params[:card].require(:articles).permit(:id, :title, :price, :count, :anzahl, :sum)
  end
end