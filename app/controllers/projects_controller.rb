# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show]

  # GET /projects
  # GET /projects.json
  def index
    @projects = current_developer.projects.selct_view_data.group_by { |h| h['projects_name'] }
    @projects = @projects.each { |k, v| @projects[k] = v.group_by { |h| h['status'] } }
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @status = @project.tasks.status_count
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params.merge(manager_id: current_developer.id))
    @project.developer_ids = params[:developer_ids].map(&:to_i)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:name, :description)
  end
end
