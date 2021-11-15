class QueueJobSerializer < ActiveModel::Serializer
  attributes :id, :queue_type, :priority, :status, :user_id
end
