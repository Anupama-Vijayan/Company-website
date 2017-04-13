class IlanceUser < ActiveRecord::Base
	has_many :ilance_projects, :foreign_key => :user_id

	attr_accessor :pass_key
	before_save :encrypt_password
	validates_confirmation_of :pass_key
	

	def encrypt_password
		self.salt = BCrypt::Engine.generate_salt
		self.password = BCrypt::Engine.hash_secret(pass_key, salt)
	end

	def self.authenticate(user_name, pass_key)
		p "==================#{user_name}"
		user = IlanceUser.where(username: user_name).first
		if user && user.password == BCrypt::Engine.hash_secret(pass_key, user.salt)
			user
		else
			nil
		end
	end
end
