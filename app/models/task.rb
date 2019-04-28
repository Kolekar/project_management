# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :developers_project

  enum status: %i[backlog in_progress done]

  validates :name, :developers_project, :status, presence: true
  validates :developers_project_id, numericality: { only_integer: true }
end
