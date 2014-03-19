class RegistrationsController < ApplicationController
  
  def show
    @lesson = Lesson.find(params[:id])
    @lesson.students.each do |student|
      Registration.create(student_id: student.id, lesson_id: @lesson.id )
    end
  end

end
