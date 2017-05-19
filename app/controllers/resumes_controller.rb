class ResumesController < ApplicationController
  def index
    @resumes = Resume.all
    @users = User.with_role(:event)
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)

    if @resume.save
      flash[:success] = "Das Dokument \"#{@resume.name}\" wurde erfolgreich hochgeladen."
      redirect_to "/dokumente"
    else
      render "new"
    end

  end

  def addDoc
    @resume = Resume.new(doc_params)
    @resume.save
    @account = Account.new
    @account.accountName = params[:accountName]
    @account.resume_id = @resume.id
    @account.save
    flash[:success] = "Das Dokument erfolgreich hochgeladen und Ihrem Benutzer hinzugefügt."
    redirect_to "/dokumente/" + params[:accountName]
  end

  def addDocWithExist
    @account = Account.new
    @account.accountName = params[:accountName]
    @account.resume_id = doc_exist_params[:resume_id]
    @account.save
    flash[:success] = "Das Dokument erfolgreich Ihrem Benutzer hinzugefügt."
    redirect_to "/dokumente/" + params[:accountName]
  end

  def showAccount
    @accounts = Account.where(accountName: params[:name])
    @documents = []
    @allDocuments = Resume.all
    @accounts.each do |d|
      @resume = Resume.find(d.resume_id)
      @documents.push({:id => d.resume_id, :name => @resume.name, :url => @resume.attachment_url, :accountId => d.id})
    end
  end

  def getDocuments
    @name = params[:accountName]
    @accounts = Account.where(accountName: params[:accountName])
    @documents = []
    @allDocuments = Resume.all
    @accounts.each do |d|
      @resume = Resume.find(d.resume_id)
      @documents.push({:id => d.resume_id, :name => @resume.name, :url => @resume.attachment_url, :accountId => d.id})
    end
  end

  def destroyDocument
    @account = Account.find(params[:id])
    @name = @account.accountName
    @account.destroy
    flash[:success] = "Dokument wurde erfolgreich entfernt."
    redirect_to "/dokumente/" + @name
  end

  def destroyAcc
    @user = User.find(params[:id])
    @events = CEvent.where(accountName: @user.email)
    @events.each do |event|
      event.accountName = ""
      event.save
    end
    @accounts = Account.where(accountName: @user.email)
    @accounts.each do |account|
      account.destroy
    end
    @account = Account.where(accountName: @user.email)
    @user.destroy
    flash[:success] = "Benutzer wurde erfolgreich entfernt."
    redirect_to "/dokumente/"
  end

  def newUser

    @user = User.new({ :email => user_params[:nickname], :roles => Role.where(name: "event"), :password => user_params[:password], :password_confirmation => user_params[:password] })
    @salt  = SecureRandom.random_bytes(64)
    @key   = ActiveSupport::KeyGenerator.new('password').generate_key(@salt, 32) # => "\x89\xE0\x156\xAC..."
    @crypt = ActiveSupport::MessageEncryptor.new(@key)                           # => #<ActiveSupport::MessageEncryptor ...>
    @encrypted_data = @crypt.encrypt_and_sign(user_params[:password])
    @user.pass = @encrypted_data
    @user.key = @key
    # crypt.decrypt_and_verify(encrypted_data)
    if @user.save
      flash[:success] = "Benutzer wurde erfolgreich erstellt."
      redirect_to "/dokumente"
    else
      flash[:error] = "Benutzer wurde nicht erstellt."
      redirect_to "/dokumente"
    end
  end


  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    flash[:success] = "Das Dokument \"#{@resume.name}\" wurde erfolgreich gelöscht."
    redirect_to resumes_path
  end

  private
    def resume_params
      params.require(:resume).permit(:name, :attachment)
    end

    def user_params
      params.require(:user).permit(:nickname, :password)
    end

    def doc_params
      params.require(:doc).permit(:name, :attachment)
    end

    def doc_exist_params
      params.require(:docExist).permit(:resume_id)
    end

end