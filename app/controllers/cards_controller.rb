class CardsController < ApplicationController

  respond_to :json
  before_action :card_params, only: [:create, :show, :edit, :update, :destroy]
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
    @newPerson.name = params[:name]
    @newPerson.vorname = params[:vorname]
    @newPerson.einrichtung = params[:einrichtung]
    @newPerson.adresse = params[:adresse]
    @newPerson.ort = params[:ort]
    @newPerson.email = params[:email]

    if @newPerson.save

#        format.json { render :index, status: :created, location: @news }
    else

    end

    @card.person = @newPerson
    @sum = 0
    #puts(params[:articles].to_s)
    #articleParam.require(:article).permit(:id, :name, :price)
    #puts(card_params[:articles].to_s)
    card_params[:articles].each do |a|
    #  puts(a[:id])
      @article = Article.find(a[:id])
      @sum += @article.price
    #  puts(@article)
      @card.articles << @article

      @article.count = @article.count - a[:anzahl]
      @article.save
   #   @localArticle.add(Article.find(a.id))
    end
    @card.sum = @sum


    # TODO Tests
    # @c_event.userMail = current_user.email

    if @card.save
      BookingMailer.contact_email(@newPerson, @card.articles, @card).deliver
#        format.json { render :index, status: :created, location: @news }
    else

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


  def card_params
    params.require(:card).permit(:articles => [:id, :name, :price, :count, :anzahl])

  end

  def article_params
    params[:card].require(:articles).permit(:id, :name, :price)
  end
end