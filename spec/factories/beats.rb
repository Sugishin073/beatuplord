FactoryBot.define do
  factory :beat do
    title { Faker::Lorem.sentence }
    genre_id { 1 }
    vibes_id { 1 }
    association :user

    after(:build) do |beat|
      # ランダムにMP3またはWAV形式のファイルを添付
      file_path = [Rails.root.join('spec/fixtures/files/sample.mp3'),
                   Rails.root.join('spec/fixtures/files/sample.wav')].sample
      beat.audio_file.attach(
        io: File.open(file_path),
        filename: File.basename(file_path),
        content_type: file_path.extname == '.mp3' ? 'audio/mpeg' : 'audio/wav'
      )
    end
  end
end