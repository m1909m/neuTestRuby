class ResumesController < ApplicationController
  def index
    @resumes = Resume.all
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

  def getDocuments
    @accounts = Account.where(accountName: params[:accountName])
    @documents = []
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

end