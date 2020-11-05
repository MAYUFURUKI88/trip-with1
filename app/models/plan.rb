class Plan < ApplicationRecord
  belongs_to :user
  has_many :joints
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :trip
  belongs_to :capacity
  belongs_to :sex

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
  end
end
