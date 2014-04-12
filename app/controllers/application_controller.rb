class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!, :get_organisation

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  protected
  def after_sign_in_path_for(resource)
    organisations_path
  end

  def get_organisation
    @organisation = Organisation.find(params[:organisation_id]) unless params[:controller] =~ /devise/
  end


end
