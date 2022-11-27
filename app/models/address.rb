class Address < ApplicationRecord
  with_options presence: true do
    validates :postal_code, numericality: {with: /\A\d{3}-\d{4}\z/, message: "code is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number ,length:{minimum: 10, maximum: 11 },numericality:{with:/\A\d\z/, message: "number is invalid. Input only number"}
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  belongs_to :order
end
