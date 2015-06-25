
class User < ActiveRecord::Base
  # Remember to create a migration!
	def self.authenticate(email, password)
		User.find_by(email: email, password: password)
	end

end
