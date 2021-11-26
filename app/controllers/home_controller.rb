class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  #  render plain: "This is homepage"
  render "index"
  end
end
