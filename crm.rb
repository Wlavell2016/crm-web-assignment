require 'sinatra'
require_relative 'contact'


# Fake data


get '/' do
	@crm_app_name = "Bitmaker's CRM"
	@server_time = Time.now
   erb :index
end

get '/contacts' do
 #@contacts = params[:contacts].upcase
 erb :contacts
end

get '/contacts/new' do
 #@contacts = params[:contacts].upcase
 erb :new_contact
end

post '/contacts' do
	puts params
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end
# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
