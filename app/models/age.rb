class Age < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '１０代' },
    { id: 3, name: '２０代' },
    { id: 4, name: '３０代' },
    { id: 5, name: '４０代' },
    { id: 6, name: '５０代' }
  ]

  include ActiveHash::Associations
  has_many :plans
end
