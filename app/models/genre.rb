class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'Boom Bap' },
    { id: 3, name: 'Lo-Fi Hip Hop' },
    { id: 4, name: 'Trap' },
    { id: 5, name: 'Drill' },
    { id: 6, name: 'Chillout' },
    { id: 7, name: 'Ambient' },
    { id: 8, name: 'Dubstep' },
    { id: 9, name: 'T' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :beats

end