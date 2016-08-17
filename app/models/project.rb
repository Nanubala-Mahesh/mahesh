class Project < ActiveRecord::Base
	#has_many :join_table
	#has_many :associated_table, through: :jojn_table

	has_many :project_categories
	has_many :categories, through: :project_categories 



	belongs_to :client
	has_many :tasks
	belongs_to :user

	validates_presence_of :name, :description, :start_date, :end_date, :client_id, :budget, :status
	validates_length_of :description, minimum: 10
	validates_numericality_of :client_id

	#customer validations
	validate :check_date
	before_destroy :destroy_all_tasks

	def self.new_projects
		Project.where('status = ?', "new")
	end

	def iscompleted_tasks
		self.tasks.where('is_completed = ?' , true)
	end
	def incompleted_tasks
		self.tasks.where('is_completed = ?' , false)
	end




	private
	def destroy_all_tasks
		self.tasks.each do |task|
			task.destroy
	 	#Task.where('project_id = ?' , self.id).delete_all
	end

	def check_date
		if (!self.end_date.nil? && !self.start_date.nil?) && (self.end_date <= self.start_date)
			errors.add(:end_date, "should be greater than the start date")
		end
	end
end

	def details
		"#{self.name} - #{self.description} - #{self.status}"
	end
end
