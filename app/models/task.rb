class Task < ActiveRecord::Base
	belongs_to :project


	validates_presence_of :title
	

	#validate :check_valid_date  # if !self.project.nil?

	#private
	#def check_valid_date
	
	#	if (self.due_date < self.project.start_date || self.due_date > self.project.end_date)
	#		errors.add(:due_date, "is invalid")
	#	end
	#end

	#def check_boolean
	#	if !([true,false].include? self.is_completed)
	#		errors.add(:is_completed, "should be either true or false")
	#	end
	#end
	

	def details
		"#{self.title} - #{self.project_id} - #{self.due_date} - #{self.is_completed}"
	end
end
