class Task < ApplicationRecord
  belongs_to :project

  enum :status, { pending: 0, in_progress: 1, completed: 2 }

  validates :title, presence: true
  validates :project_id, presence: true
  validates :status, presence: true
end

