class CardOwnership < ApplicationRecord
  belongs_to :user
  belongs_to :card
  validates :count, numericality: { only_integer: true, greater_than: 0}
  has_one :card_condition
end
