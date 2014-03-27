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

  psn_profile = Profile.new(name,b_date,location,gender)
  psn = Person.new()
  psn.set_profile psn_profile

  funk = psn.kua_number
  flex = psn.kua_group
  user_name = psn.profile.name
  hot97_a = "#{user_name}'s Kua number is: #{funk}"
  hot97_b = "#{user_name}'s group is: #{flex}"
  @angiem = hot97_a + "<br>" + hot97_b 

  erb "<%= @angiem %>" 
end

