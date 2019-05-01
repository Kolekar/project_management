# frozen_string_literal: true

class DevelopersProject < ApplicationRecord
  belongs_to :developer
  belongs_to :project
  has_many :tasks

  validates :developer_id, uniqueness: { scope: :project_id }
  validates :developer, :project, presence: true
end
