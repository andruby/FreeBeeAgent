class Contact < FreeagentApi
  def self.find_by_name(name)
    Contact.find(:all).each { |c| c.organisation_name == name ? (return c) : next }
    raise Error, "No contact matches that name!"
  end
  
  def invoices(params = {})
    # Bug: view params dont work here
    Invoice.find :all, :from => "/contacts/#{id}/invoices.xml", :params => params
  end
  
  def to_s
    organisation_name || "#{first_name} #{last_name}"
  end
end