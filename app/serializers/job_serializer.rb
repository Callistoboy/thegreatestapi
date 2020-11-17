class JobSerializer < ActiveModel::Serializer
  include ActionController::Serialization
  attributes :name, :place, :company_id
end

