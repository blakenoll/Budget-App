class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :envelope

  scope :newest_first, lambda { order("date DESC") }
end
