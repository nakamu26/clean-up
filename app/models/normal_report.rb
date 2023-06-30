class NormalReport < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :location
  belongs_to :number_of_times
end
