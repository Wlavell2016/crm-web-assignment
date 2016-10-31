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
@crm_app_name = "Bitmaker's CRM"
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
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

put '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
	@contact.first_name = params[:first_name]
	@contact.last_name = params[:last_name]
	@contact.email = params[:email]
	@contact.note = params[:note]

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


# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
