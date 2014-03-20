class RegistrationsController < ApplicationController
  
  def show
    @lesson = Lesson.find(params[:id])
    @lesson.students.each do |student|
      Registration.create(student_id: student.id, lesson_id: @lesson.id )
    end
  end

  def update
    registration = Registration.find(params[:id])
    
    if params[:attended]
      registration.attended = true
      registration.save
    else
      registration.attended = false
      registration.save      
    end

    respond_to do |format|
      format.js
    end
  end

end
