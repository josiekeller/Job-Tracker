class JobsController < ApplicationController
before_action :authenticate_user!

	def index
		@jobs = current_user.jobs
	end

	def new
		@job = Job.new
	end

	def create
		@job = current_user.jobs.build(job_params)
		# @job = Job.new(job_params)
		# @job.user = current_user
		@job.save
		redirect_to jobs_path
	end

	def edit
		@job = Job.find(params[:id])
	end

	def update
		@job = Job.find(params[:id])

		if @job.update(job_params)
			redirect_to jobs_path
		else
			render 'edit'
		end
	end

	def destroy
		@job = Job.find(params[:id])
		@job.destroy

		redirect_to jobs_path
	end

	private
		def job_params
			params.require(:job).permit(:company, :title, :url, :apply)
		end
end