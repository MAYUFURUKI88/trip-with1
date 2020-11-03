class Capacity < ActiveHash::Base
  self.data =[
    { id: 1, name: "--" },
    { id: 2, name: "２人" },
    { id: 3, name: "３人" },
    { id: 4, name: "４人" },
    { id: 5, name: "５人" },
    { id: 6, name: "６人" },
    { id: 7, name: "７人" },
    { id: 8, name: "８人" },
    { id: 9, name: "９人" },
    { id: 10, name: "１０人" }
  ]
  include ActiveHash::Associations
  has_many :users
end
