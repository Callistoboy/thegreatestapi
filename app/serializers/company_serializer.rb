class CompanySerializer < ActiveModel::Serializer
  include ActionController::Serialization
  attributes :name, :location
end
