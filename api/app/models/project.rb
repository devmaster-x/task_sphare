class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  
  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
end
