class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :permission_mask
  
  def role_of(role_name = :standard)
    return permission_mask_flag(ROLES[role_name])
  end
  
  private
  def permission_mask_flag(flag)
    return ( self.permission_mask & flag ) > 0
  end
  
  roles = {:standard => 1, :member => 4, :admin => 16 }
  roles.default = 0
  ROLES = roles.freeze
end
