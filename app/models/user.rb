class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  validates :address, presence: true
  validates :cpf, presence: true, uniqueness: true
  #validates :interests, presence: true, inclusion: { in: ApplicationController::INTERESTS }
  validates :user_name, uniqueness: true, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
