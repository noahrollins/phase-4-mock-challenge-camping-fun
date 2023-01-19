class CamperSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :created_at, :updated_at
end
