class QueueJobsController < ApplicationController
  
  def index
    queue_jobs = QueueJob.all
    render json: queue_jobs
  end
  
  def create
    queue_job = QueueJob.new queue_job_params
    if queue_job.save
      render json: queue_job
    else
      render json: { errors: format_activerecord_errors(queue_job.errors) },
        status: :unprocessable_entity
    end
  end

  private
    def queue_job_params
      params.require(:queue_jobs).permit(:queue_type, :priority, title: []).merge(user_id: current_user_id)
    end
end
