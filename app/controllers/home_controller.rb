class HomeController < ApplicationController
  def index
    @van = if params[:van] then Date.parse(params[:van]) else 1.year.ago.at_beginning_of_year.to_date end
    @tot = if params[:tot] then Date.parse(params[:tot]) else 1.year.ago.at_end_of_year.to_date end
  end

end
