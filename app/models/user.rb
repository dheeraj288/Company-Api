class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

         has_many :companies

         ROLES = %w{ admin } # In future add one or more method to add this 

         
  def jwt_payload
   super
   end

   # Add the meta programing for we can use it the number of method reduce 
   # This method are use in batter user practice 

      ROLES.each do |role_name|
        define_method "#{role_name}?" do 
         role == role_name
        end
    end
end

# other way to use this sniped
#    def admin?  
#     role == 'admin'
#   end
# end

