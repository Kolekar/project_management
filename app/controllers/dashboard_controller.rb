# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    if current_developer.is_manager
      @projects = current_developer.projects.projects_tasks_count
      @developers = current_developer.manager_developers
      @developers = Developer.from(@developers, 'developers').developers_tasks_count
    else
      @status = current_developer.tasks.status_count
  end
  end
end
