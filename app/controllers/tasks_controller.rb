# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_project, only: %i[new create]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = current_developer.tasks
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @developes_project = DevelopersProject.find_by(project_id: @project.id, developer_id: params[:task][:developer_id])
    @task = @developes_project.tasks.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task.project, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    current_developer.tasks.find(params[:id]).send("#{params[:status]}!") if Task.statuses.key?(params[:status])
    render json: { success: true }
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:name, :description)
  end
end
