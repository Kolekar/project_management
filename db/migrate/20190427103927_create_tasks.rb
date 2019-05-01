# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.belongs_to :developers_project, index: true
      t.integer :status, default: 0
      t.text :description

      t.timestamps
    end
  end
end
