class Feedback < ApplicationRecord
  belongs_to :tutorial
  validates :tutorial_id, presence: true
end
