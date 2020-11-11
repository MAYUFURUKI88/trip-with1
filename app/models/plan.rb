class Plan < ApplicationRecord
  has_many :joints, dependent: :destroy
  has_many :users, through: :joints
  has_many :messages, dependent: :destroy
  has_one_attached :image
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :trip
  belongs_to :capacity
  belongs_to :sex
  belongs_to :user

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

  def self.search(search)
    if search != ""
      where("message LIKE(?)", "%#{search}%")
    else
      Plan.all
    end
  end

  def self.filter_trip(trip_id)
    if trip_id
    where(trip_id: trip_id )
    else
      Plan.all
    end
  end
end
