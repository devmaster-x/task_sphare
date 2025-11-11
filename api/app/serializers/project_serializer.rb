class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :created_at, :updated_at
  belongs_to :user
  has_many :tasks
end

