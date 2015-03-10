## TODO: Implement CSV reading/writing
require 'csv'


class ContactDatabase #responsible for reading and writing this file
 
   class << self
    def write_contacts
      CSV.open('contacts.csv', 'a') do |new_contact|
        Contact.all.each do |contact|
          contact_array = [contact.first_name, contact.last_name, contact.email]
          new_contact << contact_array
       end
      end
    end

    def read_contacts
      CSV.foreach('contacts.csv') do |row|
        Contact.create(row[0], row[1], row[2]) 
      end
    end
  end
end




