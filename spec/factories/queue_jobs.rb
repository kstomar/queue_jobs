FactoryBot.define do
  factory :queue_job do
    user_id { 1 }
    priority { "low" }
    status { "waiting" }
    queue_type { "store_movie_title" }
  end
end
