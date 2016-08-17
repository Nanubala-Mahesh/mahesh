class Client < ActiveRecord::Base
	has_many :projects
	belongs_to :user

	before_create :generate_client_code

	validates_presence_of :name, :copany, :mobile, :email
	validates_length_of :mobile, is: 10
	validates_numericality_of :mobile
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates_uniqueness_of :mobile, :email, scope: :user_id

	#client = Client.first
#client.projects
#this will returns an array of projects belonging to the clients

#project = project.first
#project.client.name
#this will return the name of the client, it returns and error if project's client_id is nil






	def details
		"#{self.name} - #{self.copany} - #{self.mobile} - #{self.email} "
	end

	def list_projects
		Project.where('client_id = ?', self.id)
	end

	def list_by_status(status)
		Project.where('client_id = ? AND status = ?', self.id, status)
	end

	
	def generate_client_code
		self.code = "#{self.name[0..2]} - #{Client.last.nil? ? 1 : Client.last.id + 1}"
	end
end
