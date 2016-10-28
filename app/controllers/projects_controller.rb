class ProjectsController < ApplicationController
	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		@project.save
		redirect_to project_list_path
	# else
	# 	render "new"
	# 	end 
	end

	def index
	 	@projects = Projects.all
	 end

	def project_params
		params.require(:project).permit(:name, :duration, :teamsize, :cost, :domain,:users)
	end
end
