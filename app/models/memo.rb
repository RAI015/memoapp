class Memo < ApplicationRecord
  belongs_to :category

  validates :title, presence: true, length: { maximum: 12 }
  validates :body, presence: true, length: { maximum: 100 }
end
