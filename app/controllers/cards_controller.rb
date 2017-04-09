class CardsController < ApplicationController

  respond_to :json
  before_action :card_params, only: [:show, :edit, :update, :destroy]

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
    ActionController::Parameters.permit_all_parameters = true

    @card.person = @newPerson
    @articlePermit = params[:articles]
    @localArticle = {}
    @articles = article_params
    puts(@articlePermit)

    @articlePermit.each do |a|
      puts(a)
      @localArticle.add(Article.find(a.permit[:id]))
    end

    @card.articles = @localArticle
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
    params.require(:card).permit(:name, :vorname, :einrichtung, :adresse, :ort, :email, :articles => [])

  end

  def article_params
    params.require(:card).permit(:articles => [:id, :name, :price])
  end
end