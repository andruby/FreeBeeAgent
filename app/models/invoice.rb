class Invoice < FreeagentApi
  def mark_as_draft
    connection.put("/invoices/#{id}/mark_as_draft.xml", encode, self.class.headers).tap do |response|
      load_attributes_from_response(response)
    end
  end
  
  def mark_as_sent
    connection.put("/invoices/#{id}/mark_as_sent.xml", encode, self.class.headers).tap do |response|
      load_attributes_from_response(response)
    end
  end
  
  def mark_as_cancelled
    connection.put("/invoices/#{id}/mark_as_cancelled.xml", encode, self.class.headers).tap do |response|
      load_attributes_from_response(response)
    end
  end
  
  # Find invoices between two dates
  def self.between(from, to)
    self.find(:all, params: {:view => "#{from.to_date}_#{to.to_date}"})
  end
  
  def contact
    Contact.find self.contact_id
  end
end