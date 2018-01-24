class Spectator < ApplicationRecord
  has_many :bookings

   validates :email, uniqueness: true

   before_save :check_age_validity
   before_save :check_email_validity

   private
     def check_age_validity
       unless self.age.is_a? Integer
         self.age = 0
       end
     end

     def check_email_validity
       email = self.email
       regex = /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i
       email.scan(regex) { |clean_email| self.email = clean_email }
     end

end
