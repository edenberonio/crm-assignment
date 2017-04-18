require_relative 'contact'


class CRM


  def initialize

  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1
      add_new_contact
    when 2
      modify_existing_contact
    when 3
      delete_contact
    when 4
      display_all_contacts
    when 5
      search_by_attribute
    when 6
      abort("Goodbye!")
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp


    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    puts "Please enter the ID of the contact you wish to modify"
    userid = gets.to_i

    if Contact.find(userid) == false
      puts "Contact not found!"
    else

    puts "What do you want to modify?"
    puts '[1] First name'
    puts '[2] Last name'
    puts '[3] Email'
    puts '[4] Note'
    numbatt = gets.to_i

    case numbatt
      when 1
        attribute = "first_name"
      when 2
        attribute = "last_name"
      when 3
        attribute = "email"
      when 4
        attribute = "note"
    end

    puts "What do you want to set it to?"
    value = gets.chomp

    Contact.find(userid).update(attribute, value)
  end
  end

  def delete_contact
    puts "Please enter the ID of the contact you wish to delete"
    userid = gets.to_i
    Contact.find(userid).delete
  end





  def display_all_contacts
    Contact.all.each do |contact|
      puts "ID: #{contact.id} | Name: #{contact.first_name} #{contact.last_name} | Email: #{contact.email} | Note: #{contact.note}"
    end
  end





  def search_by_attribute
    puts "What do you want to search by?"
    puts '[1] First name'
    puts '[2] Last name'
    puts '[3] Email'
    puts '[4] Note'
    numbatt = gets.to_i

    case numbatt
      when 1
        attribute = "first_name"
      when 2
        attribute = "last_name"
      when 3
        attribute = "email"
      when 4
        attribute = "note"
    end

    puts "What do you want to search"
    value = gets.chomp
    foundcontact = Contact.find_by(attribute, value)
      puts "ID: #{foundcontact.id} | Name: #{foundcontact.first_name} #{foundcontact.last_name} | Email: #{foundcontact.email} | Note: #{foundcontact.note}"
  end

  a_crm_app = CRM.new
  a_crm_app.main_menu

end
