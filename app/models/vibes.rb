class Vibes < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'Chill' },
    { id: 3, name: 'Uplifting' },
    { id: 4, name: 'Melancholic' },
    { id: 5, name: 'Energetic' },
    { id: 6, name: 'Mysterious' },
  ]

  include ActiveHash::Associations
  has_many :beats

end