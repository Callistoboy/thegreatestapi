class ApplySerializer < ActiveModel::Serializer
  include ActionController::Serialization
  attributes :job_id, :geek_id, :read, :invited
end
