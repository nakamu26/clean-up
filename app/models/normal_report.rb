class NormalReport < ApplicationRecord
  belongs_to :user
  has_many :check_normal_reports
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :location
  belongs_to :number_of_times

  validates :point, presence: true
  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :location_id
    validates :number_of_times_id
  end
end
