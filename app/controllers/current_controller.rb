class CurrentController < ApplicationController
  def index
    if current_user.has_role?(:event)
      @email = current_user.email
      @accounts = Account.where(accountName: @email)
      @resumes = []
      @accounts.each do |a|
        @resumes.push(Resume.find(a.resume_id))
      end
    end
  end

  def mitgliedschaft
    @page = Page.where(accept: true, for: "Mitgliedschaft").order(:id).last
  end

  def impressum

  end
  def informationen

  end
  def agb

  end
  def arkrwl
    @page = Page.where(accept: true, for: "arkRwl").order(:id).last
  end
  def arkdd
    @page = Page.where(accept: true, for: "arkDD").order(:id).last
  end

end
