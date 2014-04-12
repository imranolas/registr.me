class RegistrationsController < ApplicationController
  load_and_authorize_resource :organisation

  def show
    @lesson = @organisation.lessons.find(params[:id])
  end

  def update
    registration = Registration.find(params[:id])
    registration.update_attributes(params[:registration])

    respond_to do |format|
      format.js
    end
  end

end
