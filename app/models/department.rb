class Department < ActiveRecord::Base
	validate :name, peresence: true

	has_many :employees
end
