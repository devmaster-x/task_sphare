class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status, :created_at
  belongs_to :project
end
