class ProjectsController < ApplicationController

	before_action :authenticate_user!
	load_and_authorize_resource
	def index
		if params[:status]
		@projects = current_user.projects.where('status = ?', params[:status])
	elsif params[:client_id]
		@projects = current_user.projects.where('client_id = ?', params[:client_id])
	else
		@projects = current_user.projects
	end



end

	def new
		@project = Project.new
		
	end
	def create
		@project = Project.new(project_params)
		@project.user_id = current_user.id
		if @project.save
			redirect_to projects_path notice: "Successfully created project"
		else
			render action: "new"
		end
	end
	def show
		@project = Project.find(params[:id])
		@task = Task.new
	end
	def edit
		@project = Project.find(params[:id])
	end
	def update
		@project = Project.find(params[:id])
		if @project.update_attributes(project_params)
			redirect_to project_path(@project.id), notice: "Successfully updated"
		else 
			render action: "edit"
		end
	end
	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to projects_path, notice: "Successfull deleted #{@project.name}"
	end


	private
	def project_params
		params[:project].permit(:client_id, :name, :description, :budget,:status, :start_date, :end_date, :status, :estimated_budget, category_ids: [])
	end
end
