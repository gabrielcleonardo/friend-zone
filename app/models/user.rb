class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  INTERESTS = ['Soccer', 'Hike', 'Swim', 'Get Drunk', 'Games', 'Climb']

  #search
  include PgSearch::Model
  pg_search_scope :search_by_interests,
    against: [ :interests ],
    using: {
      tsearch: { prefix: true, any_word: true } # <-- now `superman batm` will return something!
    }

  validates :name, presence: true
  validates :address, presence: true
  validates :cpf, presence: true, uniqueness: true
  #validates :interests, presence: true, inclusion: { in: INTERESTS }
  validates :user_name, uniqueness: true, presence: true

  has_one_attached :profile_pic
  has_many :user_1_matches, class_name: 'Match', foreign_key: 'user_1_id', dependent: :destroy
  has_many :user_2_matches, class_name: 'Match', foreign_key: 'user_2_id', dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
