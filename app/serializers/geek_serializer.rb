class GeekSerializer < ActiveModel::Serializer
  include ActionController::Serialization
  attributes :name, :stack, :resume
end
