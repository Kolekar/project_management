# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

manager = Developer.create!(email: 'manager@developer.com', password: '123456789', name: 'Developer A', is_manager: true)

da = Developer.create!(email: 'developera@developer.com', password: '123456789', name: 'Developer A')
db = Developer.create!(email: 'developerb@developer.com', password: '123456789', name: 'Developer B')
dc = Developer.create!(email: 'developerc@developer.com', password: '123456789', name: 'Developer C')
dd = Developer.create!(email: 'developerd@developer.com', password: '123456789', name: 'Developer D')
de = Developer.create!(email: 'developere@developer.com', password: '123456789', name: 'Developer E')

pa = manager.projects.create!(name: 'Project A', description: 'description A')
pa.developers = [da, db, dc]
pa.save!
pb = manager.projects.create!(name: 'Project B', description: 'description B')
pb.developers = [db, dc, dd]
pb.save!
pc = manager.projects.create!(name: 'Project C', description: 'description C')
pc.developers = [dc, dd, de]
pc.save!
pd = manager.projects.create!(name: 'Project D', description: 'description D')
pd.developers = [dd, de, da]
pd.save!
pe = manager.projects.create!(name: 'Project E', description: 'description E')
pe.developers = [de, da, db]
pe.save!

developers_projects = da.developers_projects
developers_projects[0].tasks.create!(name: 'To Do a1', status: :done)
developers_projects[1].tasks.create!(name: 'To Do a2', status: :done)
developers_projects[2].tasks.create!(name: 'To Do a3', status: :done)
developers_projects[0].tasks.create!(name: 'To Do a4', status: :in_progress)
developers_projects[0].tasks.create!(name: 'To Do a5', status: :backlog)
developers_projects[1].tasks.create!(name: 'To Do a6', status: :backlog)
developers_projects[2].tasks.create!(name: 'To Do a7', status: :backlog)

developers_projects = db.developers_projects
developers_projects[0].tasks.create!(name: 'To Do b1', status: :done)
developers_projects[1].tasks.create!(name: 'To Do b2', status: :in_progress)
developers_projects[2].tasks.create!(name: 'To Do b3', status: :backlog)
developers_projects[0].tasks.create!(name: 'To Do b4', status: :backlog)
