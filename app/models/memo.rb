# == Schema Information
#
# Table name: memos
#
#  id          :bigint           not null, primary key
#  body        :string(255)
#  title       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#
class Memo < ApplicationRecord
  belongs_to :category

  validates :title, presence: true, length: { maximum: 12 }
  validates :body, presence: true, length: { maximum: 100 }
end
