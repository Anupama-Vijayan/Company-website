class IlanceProjectsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_ilance_project, only: [:show, :edit, :update, :destroy]

  # GET /ilance_projects
  # GET /ilance_projects.json
  def index
    @ilance_projects = IlanceProject.all
  end

  # GET /ilance_projects/1
  # GET /ilance_projects/1.json
  def show
  end

  # GET /ilance_projects/new
  def new
    @ilance_project = IlanceProject.new
  end

  # GET /ilance_projects/1/edit
  def edit
  end

  # POST /ilance_projects
  # POST /ilance_projects.json
  def create
    @ilance_project = IlanceProject.new(ilance_project_params)

    respond_to do |format|
      if @ilance_project.save
        format.html { redirect_to @ilance_project, notice: 'Ilance project was successfully created.' }
        format.json { render :show, status: :created, location: @ilance_project }
      else
        format.html { render :new }
        format.json { render json: @ilance_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ilance_projects/1
  # PATCH/PUT /ilance_projects/1.json
  def update
    respond_to do |format|
      if @ilance_project.update(ilance_project_params)
        format.html { redirect_to @ilance_project, notice: 'Ilance project was successfully updated.' }
        format.json { render :show, status: :ok, location: @ilance_project }
      else
        format.html { render :edit }
        format.json { render json: @ilance_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ilance_projects/1
  # DELETE /ilance_projects/1.json
  def destroy
    @ilance_project.destroy
    respond_to do |format|
      format.html { redirect_to ilance_projects_url, notice: 'Ilance project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ilance_project
      @ilance_project = IlanceProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ilance_project_params
      params.fetch(:ilance_project, {})
    end
end
