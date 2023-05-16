class User < ApplicationRecord
  before_create :generate_authentication_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

      class Ability
        include CanCan::Ability
        
        def initialize(user)
          if user.admin?
            can :manage, :all
          else
            can :read, :all
            can [:create, :update], [Employee, Salary, PayrollPeriod, PayrollEntry]
          end
        end
      end
      private

  def generate_authentication_token
    self.authentication_token = loop do
      token = SecureRandom.base64(64)
      break token unless User.exists?(authentication_token: token)
    end
  end  
end
