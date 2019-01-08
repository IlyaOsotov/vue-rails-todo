class Order < ApplicationRecord
  has_many :order_items

  enum status: [:active, :archived]
end