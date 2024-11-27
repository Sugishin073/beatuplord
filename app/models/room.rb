class Room < ApplicationRecord
  belongs_to :user1, class_name: "User"
  belongs_to :user2, class_name: "User"
  has_many :messages, dependent: :destroy

  # 既存のルームがあるか確認
  def self.between(user1, user2)
    where(user1: user1, user2: user2).or(where(user1: user2, user2: user1)).first
  end
end

