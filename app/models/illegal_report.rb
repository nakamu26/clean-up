class IllegalReport < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :location

  with_options presence: true do
    validates :point
    validates :content
  end
  validates :location_id, numericality: { other_than: 0, message: "can't be blank" }
end
