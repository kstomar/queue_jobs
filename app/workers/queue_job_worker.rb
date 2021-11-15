class QueueJobWorker
  include Sidekiq::Worker

  def perform(action, args)
    send(action, args)
  end

  private
    def display_current_date_and_time(data)
      puts "Current Date and Time: #{DateTime.now.strftime("%F %T")}"
    end

    def store_movie_titles(data)
      queue_job = QueueJob.find_by_id data[:queue_job_id]
      begin
        values = data[:title].map do |t|
          {title: t}
        end
        Movie.import values
        queue_job.update(status: "done")
      rescue StandardError => e
        queue_job.update(status: "failed")
      end
    end
end
