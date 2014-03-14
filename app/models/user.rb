class User < ActiveRecord::Base
	has_many :messages
	has_secure_password

	validates :first_name, :last_name,
		presence: true,
		length: {maximum: 50}

	validates :email,
		presence: true,
		uniqueness: true

	validates :password,
		presence: true,
		length: {in: 6..20}, 
		confirmation: true,
		on: :create

	validates :password_confirmation,
		presence: true,
		on: :create
end
