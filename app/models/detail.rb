class Detail < ActiveRecord::Base
	attr_accessor:password_encrypt
    before_save :encrypt_password 
	
	validates_presence_of :firstname
	# validates :firstname, presence: { message: "Firstname is required" }
	validates_presence_of :lastname
	validates :email, :presence => true,:uniqueness => {:case_sensitive => false},format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/}
	validates_length_of :password1, :minimum => 8, :allow_blank => true

 PASSWORD_FORMAT = /\A
(?=.{8,})          # Must contain 8 or more characters
(?=.*\d)           # Must contain a digit
(?=.*[a-z])        # Must contain a lower case character
(?=.*[A-Z])        # Must contain an upper case character
(?=.*[[:^alnum:]]) # Must contain a symbol
/x

validates :password1, 
presence: true, 
# length: {in: Devise.password_length }, 
format: {with: PASSWORD_FORMAT}, 
confirmation: true, 
on: :create

validates :password1, 
allow_nil: true, 
# length: {in: Devise.password_length }, 
format: {with: PASSWORD_FORMAT}, 
confirmation: true, 
on: :update

    def encrypt_password
   		if true
    	self.password1 = BCrypt::Engine.generate_salt
    	self.password1= BCrypt::Engine.hash_secret(password_encrypt, password1)
   		end
 	end
end
