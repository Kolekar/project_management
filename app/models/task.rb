# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :developers_project

  has_one :developer, through: :developers_project
  has_one :project, through: :developers_project

  enum status: %i[backlog in_progress done]

  validates :name, :developers_project, :status, presence: true

  scope :status_count, -> { group(:status).count }
end
