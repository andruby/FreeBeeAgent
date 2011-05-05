class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :freeagent_subdomain, :freeagent_username, :freeagent_password
  validates_presence_of :freeagent_subdomain
  validates_presence_of :freeagent_username
  validates_presence_of :freeagent_password
end
