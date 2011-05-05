class FreeagentApi < ActiveResource::Base
  def self.authenticate(user)
    self.site = "https://#{user.freeagent_subdomain}.freeagentcentral.com"
    self.user = user.freeagent_username
    self.password = user.freeagent_password
    return true
  end  
end