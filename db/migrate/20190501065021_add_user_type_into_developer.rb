# frozen_string_literal: true

class AddUserTypeIntoDeveloper < ActiveRecord::Migration[5.1]
  def change
    add_column :developers, :is_manager, :boolean, default: false
    add_column :projects, :manager_id, :integer
    add_reference(:projects, :manager_id, foreign_key: { to_table: :developers })
  end
end
