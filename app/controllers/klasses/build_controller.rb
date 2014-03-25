class Klasses::BuildController < ApplicationController
include Wicked::Wizard
  #steps :lesson_details
  
  def show
    @klass = Klass.find(params[:klass_id])
    @klass.lessons.build
    render_wizard nil, { klass_id: @klass.id}
  end

  def update
    @klass = Klass.find(params[:klass][:id])
    @klass.update_attributes(params[:klass].except(:id))
    render_wizard @klass, {klass_id: @klass.id}
  end

end
