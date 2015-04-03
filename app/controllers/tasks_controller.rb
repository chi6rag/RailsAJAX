class TasksController < ApplicationController
	before_action :all_tasks, only: [:index]
	before_action :set_task, only: [:edit, :update, :destroy]

	def new
		@task = Task.new
	end

	def edit
	end

	def create
		@tasks = Task.all
		@task = Task.create(params_task)
		respond_to do |format|
			format.html
			format.js
		end
	end

	def update
		@tasks = Task.all
		@task.update_attributes(params_task)
		respond_to do |format|
			format.html
			format.js
		end
	end

	def destroy
		@task.destroy
		@tasks = Task.all
		respond_to do |format|
			format.html
			format.js
		end
	end

	private
		def set_task
			@task = Task.find(params[:id])
		end

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
