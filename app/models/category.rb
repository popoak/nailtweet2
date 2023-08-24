class Category < ActiveHash::Base

  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'Red' },
    { id: 3, name: 'Pink' },
    { id: 4, name: 'Blue' },
    { id: 5, name: 'Green' },
    { id: 6, name: 'Yellow' },
    { id: 7, name: 'Purple' },
    { id: 8, name: 'Orange' },
    { id: 9, name: 'Brown' },
    { id: 10, name: 'White' },
    { id: 11, name: 'Gold' },
  ]

  include ActiveHash::Associations
  has_many :prototypes

  
  
end






