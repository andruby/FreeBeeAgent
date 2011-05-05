class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :authenticate_with_freeagent
  before_filter :get_contacts
  
  def authenticate_with_freeagent
    FreeagentApi.authenticate(current_user) if user_signed_in?
  end
  
  def get_contacts
    @contacts = Contact.find(:all)
  end
end
