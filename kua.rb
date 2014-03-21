require 'sinatra'
# require '~/Documents/sinatra_apps/kua/lib/FEA_alpha/Test_c'
require '~/Documents/sinatra_apps/kua/lib/FEA_alpha/Person'
require '~/Documents/sinatra_apps/kua/lib/FEA_alpha/Profile'

get '/' do
  erb :form
end

post '/' do
  name = params[:person_name]
  month = params[:month]
  date = params[:date]
  year = params[:year]
  location = params[:location]
  gender = params[:gender]

  b_date = month + date + year

  psn = Person.new(name,b_date,location,gender)
  prof = Kua.new(psn)

  funk = prof.kua_number
  flex = prof.group
  hot97_a = "User's Kua number is: " + funk
  hot97_b = "User's group is: " + flex
  @angiem = hot97_a + "<br>" + hot97_b 

  erb "<%= @angiem %>" 
end

