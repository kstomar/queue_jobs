class QueueJob < ApplicationRecord
  validates :queue_type, presence: true

  validates :title, presence: true, if: :store_movie_title?

  enum status: ["waiting", "in_progress", "done", "failed"]
  enum priority: ["critical", "high", "low"]
  enum queue_type: ["display_current_date_and_time", "store_movie_title"]

  attr_accessor :title
  
  after_create :assign_job

  def assign_job
    queue = QueueJobWorker.set(queue: priority.to_sym)
    arg = store_movie_title? ? { title: title, queue_job_id: self.id } : {}
    queue.perform_async(queue_type, arg)
  end
end
