class Beat < ApplicationRecord
  has_one_attached :audio_file

  validates :title, presence: true
  validates :audio_file, presence: true
  validate :correct_audio_mime_type

  private

  # MIMEタイプのバリデーションを追加
  def correct_audio_mime_type
    if audio_file.attached? && !audio_file.content_type.in?(%w[audio/mpeg audio/wav audio/x-wav])
      errors.add(:audio_file, "はMP3またはWAV形式のみアップロードできます")
    end
  end
end
