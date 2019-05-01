# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :developers_projects
  has_many :developers, through: :developers_projects
  has_many :tasks, through: :developers_projects

  validates :name, presence: true

  belongs_to :manager, class_name: 'Developer'

  scope :join_tasks, lambda {
                       joins('LEFT JOIN "developers_projects" ON "developers_projects"."project_id" = "projects"."id"
                               LEFT JOIN "tasks" ON "tasks"."developers_project_id" = "developers_projects"."id"')
                     }

  scope :projects_tasks_count, lambda {
                                 join_tasks
                                   .group('developers_projects.project_id,
                               	  							tasks.status')
                                   .select('COUNT(tasks.id) as task_count,
                               	  							projects.id,
                               	  							projects.name,
                               	  							tasks.status')
                               }

  scope :selct_view_data, lambda {
                            join_tasks
                              .select('projects.id,
                                          	tasks.status,
                                          	projects.name as projects_name,
                                          	tasks.name as task_name')
                          }
end
