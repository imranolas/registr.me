class StudentsController < ApplicationController
  # GET /students
  # GET /students.json
  def index
    @students = Student.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
      format.csv { send_data Student.to_csv }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
    @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
    @student.lessons.each do |lesson|
      Registration.create(student_id: @student.id, lesson_id: lesson.id )
    end
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        @student.lessons.each do |lesson|
          Registration.create(student_id: @student.id, lesson_id: lesson.id )
        end
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end

  def edit_multiple
    if params[:student_ids]
      @students = Student.find(params[:student_ids])
    else
      redirect_to students_path
    end
  end

  def update_multiple
    @students = Student.find(params[:student_ids])
    @students.reject! do |student|
      student.update_attributes(params[:student].reject { |k,v| v.blank? })
      student.lessons.each do |lesson|
        Registration.create(student_id: student.id, lesson_id: lesson.id )
      end
    end
    if @students.empty?
      redirect_to students_path
    else
      render "edit_multiple"
    end
  end

  def add_comment
    student = Student.find(params[:id])
    Comment.build_from( student, current_user.id, params[:comment] )
    redirect_to student
  end

  def import
    Student.import(params[:file])
    redirect_to root_url, notice: "Students imported."
  end
end
