class CreateDevelopersProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :developers_projects do |t|
      t.integer :developer_id
      t.integer :project_id

      t.timestamps
    end
  end
end
