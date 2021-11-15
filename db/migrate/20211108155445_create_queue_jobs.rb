class CreateQueueJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :queue_jobs do |t|
      t.integer :user_id
      t.integer :priority
      t.integer :status, default: 0
      t.integer :queue_type

      t.timestamps
    end
  end
end
