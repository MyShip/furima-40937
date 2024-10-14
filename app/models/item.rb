class Item < ApplicationRecord
 
  belongs_to :user
  # has_one :order
 
  validates :name,          presence: true
  validates :explanation,   presence: true
  validates :category_id,   presence: true, numericality: { other_than: 1 } 
  validates :situation_id,  presence: true, numericality: { other_than: 1 } 
  validates :load_id,       presence: true, numericality: { other_than: 1 } 
  validates :prefecture_id, presence: true, numericality: { other_than: 1 } 
  validates :day_id,        presence: true, numericality: { other_than: 1 } 
  validates :price,         presence: true, numericality: { only_integer: true, greater_than: 0, greater_than_or_equal_to: 300, 
  less_than_or_equal_to: 9_999_999 }


  has_one_attached :image

  validates :image, presence: true, unless: :was_attached?

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :situation
    belongs_to_active_hash :load
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :day

  def was_attached?
    self.image.attached?
  end
end
