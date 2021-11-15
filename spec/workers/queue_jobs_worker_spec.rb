require 'rails_helper' 

RSpec.describe QueueJobWorker, type: :worker do

  describe 'testing worker' do
    it 'job scheduled in a queue' do
      expect do
        create(:queue_job, title: ["title"])
      end.to change(QueueJobWorker.jobs, :size).by(1)
    end
  end

end
