class TasksController < ApplicationController
	before_action :all_tasks, only: [:index, :create]
	respond_to :html, :js

	def new
		@task = Task.new
		respond_to do |format|
			format.html
			format.js
		end
	end

	def create
		@task = Task.create(params_task)
	end

	private
	
	def all_tasks
		@tasks = Task.all
		respond_to do |format|
			format.html
			format.js
		end
	end

	def params_task
		params.require(:task).permit(:description, :deadline)
	end

end
