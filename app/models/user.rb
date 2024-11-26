class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :beats
  has_one_attached :avatar

  def avatar_variant
    avatar.variant(resize: "200x200").processed
  end
end
