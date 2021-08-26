class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  INTERESTS = ['Soccer', 'Hike', 'Swim', 'Get Drunk', 'Games', 'Climb']

  validates :name, presence: true
  validates :address, presence: true
  validates :cpf, presence: true, uniqueness: true
  #validates :interests, presence: true, inclusion: { in: INTERESTS }
  validates :user_name, uniqueness: true, presence: true

  has_one_attached :profile_pic
  has_many :user_1_matches, class_name: 'Match', foreign_key: 'user_1_id'
  has_many :user_2_matches, class_name: 'Match', foreign_key: 'user_2_id'

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
