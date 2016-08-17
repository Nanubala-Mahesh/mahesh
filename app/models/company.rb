class Company < ActiveRecord::Base
	validates :name, :email, :address, presence: true

	has_many :employees
end
