class LessonsController < ApplicationController
  load_and_authorize_resource through: :organisation
  # GET /lessons
  # GET /lessons.json
  def index
    @upcoming = @organisation.lessons.upcoming
    @past = @organisation.lessons.past

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lessons }
      format.csv { send_data Lesson.to_csv }
    end
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
    @lesson = @organisation.lessons.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lesson }
    end
  end

  # GET /lessons/new
  # GET /lessons/new.json
  def new
    @lesson = Lesson.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lesson }
    end
  end

  # GET /lessons/1/edit
  def edit
    @lesson = @organisation.lessons.find(params[:id])
    
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = Lesson.new(params[:lesson])

    respond_to do |format|
      if @lesson.save
        @lesson.students.each do |student|
          Registration.create(student_id: student.id, lesson_id: @lesson.id )
        end
        format.html { redirect_to [@organisation, @lesson], notice: 'Lesson was successfully created.' }
        format.json { render json: @lesson, status: :created, location: @lesson }
      else
        format.html { render action: "new" }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lessons/1
  # PUT /lessons/1.json
  def update
    @lesson = @organisation.lessons.find(params[:id])
    @lesson.students.each do |student|
      Registration.create(student_id: student.id, lesson_id: @lesson.id )
    end

    respond_to do |format|
      if @lesson.update_attributes(params[:lesson])
        format.html { redirect_to [@organisation, @lesson], notice: 'Lesson was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson = @organisation.lessons.find(params[:id])
    @lesson.destroy

    respond_to do |format|
      format.html { redirect_to organisation_lessons_path(@organisation) }
      format.json { head :no_content }
    end
  end

  def edit_multiple
    if params[:lesson_ids]
      @lessons = @organisation.lessons.find(params[:lesson_ids])
    else
      redirect_to organisation_lessons_path(@organisation)
    end
  end

  def update_multiple
    @lessons = @organisation.lessons.find(params[:lesson_ids])
    @lessons.reject! do |lesson|
      lesson.update_attributes(params[:lesson].reject { |k,v| v.blank? })
    end
    if @lessons.empty?
      redirect_to organisation_lessons_path(@organisation)
    else
      render "edit_multiple"
    end
  end


  def import
    Lesson.import(params[:file])
    redirect_to root_url, notice: "Students imported."
  end
end
