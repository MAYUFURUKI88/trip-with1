class User < ApplicationRecord
<<<<<<< Updated upstream
=======
  has_many :joints
  has_many :plans, through: :joints
  has_many :messages
>>>>>>> Stashed changes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  with_options presence: true do
    validates :nickname
    validates :password_confirmation
  end


         has_many :plans


         extend ActiveHash::Associations::ActiveRecordExtensions
         belongs_to :sex

  
end
