class Message < ActiveRecord::Base
	belongs_to :users
	has_many :comments

	validates :description, 
		presence: true,
		length: {minimum: 10}
end
