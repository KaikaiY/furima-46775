class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :fee, :prefecture, :delivery
  has_one_attached :image

  validates :category_id, :condition_id, :fee_id, :prefecture_id, :delivery_id,
            numericality: { other_than: 1, message: "can't be blank" }
end
