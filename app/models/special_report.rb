class SpecialReport < ApplicationRecord
  class NormalReport < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :location
    belongs_to :category
  
    validates :point, presence: true
    with_options numericality: { other_than: 0, message: "can't be blank" } do
      validates :location_id
      validates :category
    end
  end 
end
