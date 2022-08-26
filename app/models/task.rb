class Task < ApplicationRecord
  validates :content, presence: true
  belongs_to :task_list
  has_many :comments
end
