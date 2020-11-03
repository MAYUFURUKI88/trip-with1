class Plan < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  
  with_options numericality: { other_than: 1 } do
  validates :trip_id
  validates :capacity_id
  end
  with_options presence: true do
    validates :title
    validates :price
    validates :first_day
    validates :final_day
    validates :deadline
    validates :message
    validates :image
  end
end