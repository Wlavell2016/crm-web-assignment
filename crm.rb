require 'sinatra'
require_relative 'contact'

get '/' do
	@crm_app_name = "Bitmaker's CRM"
   erb :index
end

get '/contacts' do
	@crm_app_name = "Bitmaker's CRM"
 #@contacts = params[:contacts].upcase
 erb :contacts
end

get '/contacts/new' do
	@crm_app_name = "Bitmaker's CRM"
 #@contacts = params[:contacts].upcase
 erb :new_contact
end

post '/contacts' do
contact =Contact.create(
	first_name: params[:first_name],
	last_name: params[:last_name],
	email:	params[:email],
	note: params[:note]
)
redirect to ('/contacts')
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
	erb :show_contact
  else
	raise Sinatra::NotFound
  end
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
	erb :edit_contact
  else
	raise Sinatra::NotFound
  end
end
# updating data
put '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
	@contact.first_name = params[:first_name]
	@contact.last_name = params[:last_name]
	@contact.email = params[:email]
	@contact.note = params[:note]
	@contact.save
	redirect to('/contacts')
  else
	raise Sinatra::NotFound
  end
end


delete '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
	@contact.delete
	redirect to('/contacts')
  else
	raise Sinatra::NotFound
  end
end

after do
	ActiveRecord::Base.connection.close
end

# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
