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
      redirect_to resumes_path, success: "Das Dokument \"#{@resume.name}\" wurde erfolgreich hochgeladen."
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
    redirect_to "/dokumente/" + params[:accountName], success: "Das Dokument erfolgreich hochgeladen und Ihrem Benutzer hinzugefügt."
  end

  def addDocWithExist
    @account = Account.new
    @account.accountName = params[:accountName]
    @account.resume_id = doc_exist_params[:resume_id]
    @account.save
    redirect_to "/dokumente/" + params[:accountName], success: "Das Dokument erfolgreich Ihrem Benutzer hinzugefügt."
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

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_path, error:  "Das Dokument \"#{@resume.name}\" wurde erfolgreich gelöscht."
  end

  private
    def resume_params
      params.require(:resume).permit(:name, :attachment)
    end

    def doc_params
      params.require(:doc).permit(:name, :attachment)
    end

    def doc_exist_params
      params.require(:docExist).permit(:resume_id)
    end

end