class NumberOfTimes < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '北海道' }, { id: 2, name: '青森県' }, { id: 3, name: '岩手県' },
    { id: 4, name: '宮城県' }, { id: 5, name: '秋田県' }, { id: 6, name: '山形県' },
    { id: 7, name: '福島県' }
  ]

  include ActiveHash::Associations
  has_many :normal_reports
end