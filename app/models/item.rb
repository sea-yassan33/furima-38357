class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :item_category_id, numericality: { other_than: 1 , message: "can't be blank"} 
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :price, numericality: {only_integer: true ,in: 300..9999999}

  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :prefecture

  belongs_to :user
  has_one_attached :image
end
