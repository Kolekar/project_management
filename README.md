# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.3.3

* System dependencies:\
  ubuntu\
  ruby\
  rails

* Database creation:\
  rake db:create\
  rake db:migrate

* Database initialization:\
  rake db:seed

* How to run the test suite:\
  rspec(Inprogress)

* How to run the application:\
  rails s

* Assignment: [PDF](RORAssignment.pdf) \ 
Write a Rails application for managing projects weekly todo list. 
 
In an organization project manager generally work with multiple projects, multiple teams, team 
member. 
 
Often it happens, he misses out some of the minute details like who is working on what at current 
point of time. 
 
Also sometime it may happen,in a day some team members are too busy but some are free. 
You have to build a system which will help project manager in creating a todo list for project and help 
to show status of system at any given point  of time. 
 
1. System should have well defined authentication system (Use any gem like Devise) 
 
2. System should have well defined authorization system (You can use gem like 'cancan' or just 
build your own way of handling it) 
 
3. System has only two roles  
1. admin(Project Manager) 
2. developer 
 
 
4. As admin, 
3. He/She should be able to create a project  
4. He/She should be able to create a todo for project (e.g "Design database for feature 
X") 
5. He/She should be able to assign a todo to developer 
6. He/She should be able to add developer to project (Note: Project can have many 
developer and developer can have many projects) 
 
 
5. As developer, 
1. He/She should be able to see a todo list for him. 
2. He/She should be able to mark is 'in progress' or 'Done'.  
 
6. On admin's dashboard (After login page), 
1. At any given point of time he will see a list of all developer list with todo in following 
format. 
 
 
 
2.
3.
Show same view as above, but instead of developer it should show data project‐wise. 
Also show graph using google chart api (https://developers.google.com/chart/) 
 
Show project‐wise pie chart for todo's status  like, 5 is in Done state, 10 is in new State and 4 is in 
progress 
 
