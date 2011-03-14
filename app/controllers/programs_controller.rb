class ProgramsController < ApplicationController
  # GET /programs
  # GET /programs.xml
  def index
    @programs = Programs.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @programs }
    end
  end

  # GET /programs/1
  # GET /programs/1.xml
  def show
    @programs = Programs.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @programs }
    end
  end

  # GET /programs/new
  # GET /programs/new.xml
  def new
    @programs = Programs.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @programs }
    end
  end

  # GET /programs/1/edit
  def edit
    @programs = Programs.find(params[:id])
  end

  # POST /programs
  # POST /programs.xml
  def create
    @programs = Programs.new(params[:programs])

    respond_to do |format|
      if @programs.save
        flash[:notice] = 'Programs was successfully created.'
        format.html { redirect_to(@programs) }
        format.xml  { render :xml => @programs, :status => :created, :location => @programs }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @programs.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /programs/1
  # PUT /programs/1.xml
  def update
    @programs = Programs.find(params[:id])

    respond_to do |format|
      if @programs.update_attributes(params[:programs])
        flash[:notice] = 'Programs was successfully updated.'
        format.html { redirect_to(@programs) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @programs.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /programs/1
  # DELETE /programs/1.xml
  def destroy
    @programs = Programs.find(params[:id])
    @programs.destroy

    respond_to do |format|
      format.html { redirect_to(programs_url) }
      format.xml  { head :ok }
    end
  end
end
