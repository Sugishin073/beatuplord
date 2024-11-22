class Beat < ApplicationRecord
  has_one_attached :audio_file

  validates :title, presence: true
  validates :audio_file, presence: true
  validate :correct_audio_mime_type
  validates :genre_id, numericality: { other_than: 1 } 
  validates :vibes_id, numericality: { other_than: 1 } 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :vibes
  has_one_attached :audio_file
  belongs_to :user

  private

  # MIMEタイプのバリデーションを追加
  def correct_audio_mime_type
    if audio_file.attached? && !audio_file.content_type.in?(%w[audio/mpeg audio/wav audio/x-wav])
      errors.add(:audio_file, "はMP3またはWAV形式のみアップロードできます")
    end
  end
end
