class CardsController < ApplicationController

  respond_to :json
  before_action :card_params, only: [:show, :edit, :update, :destroy]
 # before_action :article_params, only: [:create]

  def index
    #  @events = CEvent.where(start: params[:start]..params[:end])
    #@c_events = CEvent.all
    respond_to do |format|
#      format.json { render json: CEvent.where(room_id: params[:roomid])}
    end
  end

  def booking

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
    @localArticle = {}
    puts(params[:articles].to_s)
    #articleParam.require(:article).permit(:id, :name, :price)
    puts(params[:articles].id)
   # article_params.each do |a|
   #   puts(a.name)
   #   @localArticle.add(Article.find(a.id))
   # end

    @article = Article.find(1)
    puts(@article)
    @card.booking.create(article: @article)
    # TODO Tests
    # @c_event.userMail = current_user.email
    respond_to do |format|
      if @card.save

#        format.json { render :index, status: :created, location: @news }
      else
        format.html { render :booking }
        format.json { render json: @card.errors, status: :unprocessable_entity }
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


  def card_params
    params.require(:card).permit(:name, :vorname, :einrichtung, :adresse, :ort, :email, :articles)

  end

  def article_params
    params[:card].require(:articles).permit(:id, :name, :price)
  end
end