require 'digest/sha1'

class User < ActiveRecord::Base
	include RademadeAdmin::UserModule

	validates :email, uniqueness: { case_sensitive: false }

	before_create :default_values

	def self.get_by_email(email)
		self.find_by(:email => email)
	end

	def default_values
		self.admin = false if self.admin.nil?
	end

	def password=(password)
		self.encrypted_password = encrypt_password(password) unless password.blank?
	end

	def password
		self.encrypted_password
	end

	def valid_password?(password)
		self.encrypted_password == encrypt_password(password)
	end

	def to_s
		"#{first_name} #{last_name}"
	end

	private

	def encrypt_password(password)
		Digest::SHA1.hexdigest(password)
	end

end