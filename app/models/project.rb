# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :developers_projects
  has_many :developers, through: :developers_projects

  validates :name, presence: true
end
