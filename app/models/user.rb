class User < ApplicationRecord
  rolify
  # has_and_belongs_to_many :roles, :join_table => :users_roles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  private
  def set_default_role
    # Add the default role if no roles is set
    self.roles << Role.find_by_name('default') if roles.empty?
  end
end
