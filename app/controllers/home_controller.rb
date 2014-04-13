class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, :get_organisation
  def index
    render :index, layout: false
  end
end
