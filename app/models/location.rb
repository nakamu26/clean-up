class Location < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '当代島' }, { id: 2, name: '猫実' }, { id: 3, name: '入船' },
    { id: 4, name: '東野' }, { id: 5, name: '堀江' }, { id: 6, name: '弁天' },
    { id: 7, name: '北栄' }
  ]

  include ActiveHash::Associations
  has_many :normal_reports
  has_many :special_reports
  has_many :illegal_reports
end
