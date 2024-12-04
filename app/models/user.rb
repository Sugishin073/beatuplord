class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  has_many :beats
  has_one_attached :avatar
  has_many :sent_rooms, class_name: "Room", foreign_key: "user1_id"
  has_many :received_rooms, class_name: "Room", foreign_key: "user2_id"
  has_many :comments

  def avatar_variant
    avatar.variant(resize: "200x200").processed
  end
end
