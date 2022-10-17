class Project < ApplicationRecord
  validates :title, presence: :true
  validates :password, presence: :true
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
end
