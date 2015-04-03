class TasksController < ApplicationController
	before_action :all_tasks, only: [:index]

	def new
		@task = Task.new
	end

	def create
		@tasks = Task.all
		@task = Task.create(params_task)
		respond_to do |format|
			format.html
			format.js
		end
	end

	private
		def all_tasks
			@tasks = Task.all
			respond_to do |format|
				format.html
				format.json
			end
		end

		def params_task
			params.require(:task).permit(:description, :deadline)
		end
end
