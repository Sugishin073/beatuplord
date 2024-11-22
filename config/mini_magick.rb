require "mini_magick"

MiniMagick.configure do |config|
  config.cli = :imagemagick # ImageMagickを使用する場合
end