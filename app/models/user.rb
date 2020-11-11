class User < ApplicationRecord
  has_many :plans, dependent: :destroy
  has_many :joints
  has_many :joint_plans, through: :joints, class_name: 'Plan'
  has_many :messages
  has_many :sns_credentials
  has_many :likes, dependent: :destroy
  has_many :liked_plans, through: :likes, source: :plan

  def already_liked?(plan)
    likes.exists?(plan_id: plan.id)
  end

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
      email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }, length: { minimum: 6 }
  with_options presence: true do
    validates :nickname
    validates :password_confirmation
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex
  belongs_to :age
  belongs_to :prefecture
end
