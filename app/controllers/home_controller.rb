class HomeController < ApplicationController
  def index
    @van = if params[:van] then Date.parse(params[:van]) else 1.year.ago.at_beginning_of_year.to_date end
    @tot = if params[:tot] then Date.parse(params[:tot]) else 1.year.ago.at_end_of_year.to_date end
    @minimum = params[:minimum].try(:to_i) || 250
    @grouped_invoices = Invoice.between(@van, @tot).group_by(&:contact_id).reject do |c_id, invoices| 
      invoices.inject(0) { |sum, i| sum + i.net_value } < @minimum
    end
    @invoices = @grouped_invoices.values.flatten
  end

end
