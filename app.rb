require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/project")
require('./lib/volunteer')
require("pry")
require("pg")

DB = PG.conncet({:dbname => "volunteer_tracker"})

get ('/') do
  @list = Volunteer.all()
  erb(:input)
end


get ('/project') do
  erb(:project)
end

get ('/volunteer') do
  @volunteer_list = Volunteer.all()
  erb(:volunteer)
end


post ('/volunteer') do
  @volunteer_name = params["volunteer_name"]
  new_volunteer_name = Volunteer.new({:volunteer_name => @volunteer_name})
  new_volunteer_name.save()
  redirect to('/volunteer')
end
