class Detail < ActiveRecord::Base
	attr_accessor:password1
    before_save :encrypt_password 
     def encrypt_password
   if true
     self.password1 = BCrypt::Engine.generate_salt
     self.password1= BCrypt::Engine.hash_secret(password1, password1)
   end
 end
end
