class UsersController < ActionController

  def new
    @user = Users.new
  end

  def create
    @user = Users.new(user_params)
    if @user.save
      respond to |format|
        format.html()
      end
    end
  end

  private

  def user_params
    params.require(:user).permit( :email, :firstname, :lastname, :street, :plz, :city, :roles_ids)
  end
end
