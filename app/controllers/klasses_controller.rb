class KlassesController < ApplicationController
  # GET /klasses
  # GET /klasses.json
  def index
    @klasses = Klass.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @klasses }
    end
  end

  # GET /klasses/1
  # GET /klasses/1.json
  def show
    @klass = Klass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @klass }
    end
  end

  # GET /klasses/new
  # GET /klasses/new.json
  def new
    @klass = Klass.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @klass }
    end
  end

  # GET /klasses/1/edit
  def edit
    @klass = Klass.find(params[:id])
  end

  # POST /klasses
  # POST /klasses.json
  def create
    @klass = Klass.new(params[:klass])

    respond_to do |format|
      if @klass.save
        format.html { redirect_to @klass, notice: 'Klass was successfully created.' }
        format.json { render json: @klass, status: :created, location: @klass }
      else
        format.html { render action: "new" }
        format.json { render json: @klass.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /klasses/1
  # PUT /klasses/1.json
  def update
    @klass = Klass.find(params[:id])

    respond_to do |format|
      if @klass.update_attributes(params[:klass])
        format.html { redirect_to @klass, notice: 'Klass was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @klass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /klasses/1
  # DELETE /klasses/1.json
  def destroy
    @klass = Klass.find(params[:id])
    @klass.destroy

    respond_to do |format|
      format.html { redirect_to klasses_url }
      format.json { head :no_content }
    end
  end
end
