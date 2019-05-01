# frozen_string_literal: true

class Developer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :developers_projects
  has_many :projects, through: :developers_projects
  has_many :tasks, through: :developers_projects
  has_many :projects, foreign_key: :manager_id
  has_many :manager_developers, -> { distinct }, through: :projects, class_name: 'Developer', source: 'developers'

  validates :name, presence: true

  scope :developers, -> { where(is_manager: false) }
  scope :managers, -> { where(is_manager: true) }
  scope :joins_tasks, -> { joins('LEFT JOIN "developers_projects" ON "developers_projects"."developer_id" = "developers"."id" LEFT JOIN "tasks" ON "tasks"."developers_project_id" = "developers_projects"."id"') }

  scope :developers_tasks_count, lambda {
                                   joins_tasks
                                     .group('developers_projects.developer_id,
                                 	  							tasks.status')
                                     .select('COUNT(tasks.id) as task_count,
                                 	  							developers.id,
                                 	  							developers.name,
                                 	  							tasks.status')
                                 }

  scope :selct_view_data, lambda {
                            joins_tasks
                              .select('tasks.status,
                                          	developers.name as developers_name,
                                          	tasks.name as task_name')
                          }
end
