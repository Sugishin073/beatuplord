class Comment < ApplicationRecord
  belongs_to :beat
  belongs_to :user
end
