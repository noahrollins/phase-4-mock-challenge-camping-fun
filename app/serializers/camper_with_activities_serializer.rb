class CamperWithActivitySerializer < ActiveModel::Serializer
    attributes :id, :name, :age, :created_at, :updated_at
    has_many :activities
  end
  