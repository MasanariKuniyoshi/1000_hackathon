class TaskList < ApplicationRecord
  validates :content, presence: true
  has_many :tasks
end
