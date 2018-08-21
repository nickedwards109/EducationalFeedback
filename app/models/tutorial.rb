class Tutorial < ApplicationRecord
  validates :name, presence: true
  validates :slug, presence: true
end
