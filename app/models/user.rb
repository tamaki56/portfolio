class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :recipes, dependent: :destroy
         has_many :favorites, dependent: :destroy
         
          validates :name, presence: true
          validates :nickname, presence: true
          validates :email, presence: true
end
