class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '収集不可' }, { id: 2, name: '未収集' }
  ]

  include ActiveHash::Associations
  has_many :special_reports
end
