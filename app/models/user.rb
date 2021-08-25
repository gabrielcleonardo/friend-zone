class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, presence: true
  validates :address, presence: true
  validates :cpf, presence: true, uniqueness: true
  #validates :interests, presence: true, inclusion: { in: ApplicationController::INTERESTS }
  validates :user_name, uniqueness: true, presence: true
  has_many :user_1_matches, class_name: 'Match', foreign_key: 'user_1_id'
  has_many :user_2_matches, class_name: 'Match', foreign_key: 'user_2_id'


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
