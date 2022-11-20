class Item < ApplicationRecord
  with_options presence: true do
    validates :image
  end

  belongs_to :user
  has_one_attached :image
end
