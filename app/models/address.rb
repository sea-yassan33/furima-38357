class Address < ApplicationRecord
  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  belongs_to :order
end
