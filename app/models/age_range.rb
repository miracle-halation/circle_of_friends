class AgeRange < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '20代~30代' },
    { id: 3, name: '30代~40代' },
    { id: 4, name: '40代~50代' },
    { id: 5, name: '50代~60代' },
    { id: 6, name: '60代~' }
  ]
end
