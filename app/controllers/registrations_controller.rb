class RegistrationsController < ApplicationController
  
  def show
    @lesson = Lesson.find(params[:id])
  end

  def update
    registration = Registration.find(params[:id])
    registration.update_attributes(params[:registration])

    respond_to do |format|
      format.js
    end
  end

end
