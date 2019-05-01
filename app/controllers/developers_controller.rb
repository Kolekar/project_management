# frozen_string_literal: true

class DevelopersController < ApplicationController
  before_action :authonticate_manager!

  def index
    @developers = current_developer.manager_developers
    @developers = Developer.from(@developers, 'developers').selct_view_data
                           .group_by { |h| h['developers_name'] }
    @developers = @developers.each { |k, v| @developers[k] = v.group_by { |h| h['status'] } }
  end
end
