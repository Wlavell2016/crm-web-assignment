require 'pry'

class Contact

	 attr_accessor :first_name, :last_name, :email, :note
	 attr_reader :id
	 @@contacts = []
	 @@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name , last_name, email, note="")
	  @first_name = first_name
	  @last_name = last_name
	  @email = email
	  @note = note
	  @id = @@id
	  @@id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
	  new_contact = Contact.new(first_name, last_name, email, note)
	  @@contacts << new_contact
	  return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
		return @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
	  @@contacts.each do |contact|
		  if contact.id == id
			  return contact
		  end
	  end
  end

  def self.find_first_name(first_name)
	@@contacts.each do |contact|
		if contact.first_name.downcase == first_name.downcase
			return contact
		end
	end
  end

  def self.find_last_name(last_name)
	@@contacts.each do |contact|
		if contact.last_name == last_name
			return contact
		end
	end
	return false
  end

  def self.find_email(email)
	@@contacts.each do |contact|
		if contact.email == email
			return contact
		end
	end
  end


  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, value)
	  attri_update = attribute
	  attri_value = value
	  if attri_update == "first_name"
		  self.first_name = attri_value
	  elsif
		  attri_update == "last_name"
		  self.last_name = attri_value
	  elsif
		  attri_update == "email"
		  self.email = attri_value
	  elsif
		  attri_update == "note"
		  self.note = attri_value
	  else
		  puts "wtf"
		  return attri_value
	  end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
	  attri_name = attribute
	  attri_value = value
	case attri_name
		  when "first_name"
			  find_first_name(attri_value)
		  when  "last_name"
			  find_last_name(attri_value)
		  when  "email"
			  find_email(attri_value)
		  else
			"finish"
		  end
	 end



  # This method should delete all of the contacts
  def self.delete_all
	  @@contacts = []
  end

  def full_name
	  return "#{first_name} #{last_name}"
  end

=begin
 def findindex
	  @@contacts.each_with_index do |contact, index|
		  if @id == contact.id
			  return index
		  end
	  end
=end
  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
	  @@contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.

end

William = Contact.create("william","lavell","william.lavell@gmail.com","is amazing")
Sam = Contact.create("Sam","smith","Sam.lavell@gmail.com","is amazing")





#   ruby test/contact_test.rb
