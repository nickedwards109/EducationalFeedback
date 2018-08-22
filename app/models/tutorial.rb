class Tutorial < ApplicationRecord
  validates :name, presence: true
  validates :slug, presence: true
  has_many :feedbacks
end
