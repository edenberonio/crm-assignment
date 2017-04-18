class Contact
  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  #A class variable is a variable thats declared at the class level and shared across all objets of the same type.
  #setup a class variable to store array of all contacts we create
  #ensures that our contacts have a unique identifier
  #available to all Contact object instances

  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note

    # our initialize method should be responsible for setting the first name, last name, email and note that get passed in from the create method
    #additionally it should set the id of the contact and increment the class @@id variable so that the next contact will get a diff id
    @id = @@id
    @id += 1 #this way the next contact will ge a differnt id


  end

  # a getter (*get* the value of an attribute)
  def email
    @email
  end

  #a setter (*set* the value of an attribute)
  def note= (note)
    @note

  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
     @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(contactid)
    @@contacts.each do |contact|
     if contact.id == contactid
       return contact
     end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update
    case attribute
   when "first_name"
     self.first_name = value
   when "last_name"
     self.last_name = value
   when "email"
     self.email = value
   when "note"
     self.note = value
   end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute,value)
    def self.find_by(attribute, value)
    case attribute
    when "first_name"
      @@contacts.each do |contact|
        if contact.first_name == value
          return contact
        end
      end
    when "last_name"
      @@contacts.each do |contact|
        if contact.last_name == value
          return contact
        end
      end
    when "email"
      @@contacts.each do |contact|
        if contact.email == value
          return contact
        end
      end
    when "note"
      @@contacts.each do |contact|
        if contact.note == value
          return contact
        end
      end
    end
end

  end

  # This method should delete all of the contacts
  def self.delete_all
      @@contacts.clear
  end

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
     @@contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.

end
