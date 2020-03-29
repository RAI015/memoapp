# == Schema Information
#
# Table name: memos
#
#  id          :bigint           not null, primary key
#  body        :string(255)
#  picture     :string(255)
#  title       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#
class Memo < ApplicationRecord
  belongs_to :category
  mount_uploader :picture, PictureUploader

  validates :title, presence: true, length: { maximum: 12 }
  validates :body, presence: true, length: { maximum: 100 }
  validate :picture_size

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, 'ファイルサイズを5MB以下にしてください')
    end
  end
end
