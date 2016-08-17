class Employee < ActiveRecord::Base
	validates :first_name, :last_name, :company_id, presence: true

	belongs_to :company
	belongs_to :department
	before_create :generate_employee_code

	def generate_employee_code
		self.employees_code = "#{self.first_name[0..2]} - #{Employee.last.nil? ? 1 : Employee.last.id + 1} "
	end
end
