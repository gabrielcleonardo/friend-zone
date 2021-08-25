class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  INTERESTS = ['Soccer', 'Hike', 'Swim', 'Get Drunk', 'Games', 'Climb']
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
  validates :address, presence: true
  validates :cpf, presence: true, uniqueness: true
  #validates :interests, presence: true, inclusion: { in: INTERESTS }
  validates :user_name, uniqueness: true, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
