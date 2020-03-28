# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string(255)      not null
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,
    presence: true,
    length: { maximum: 20 }
  validates :email,
    presence: true,
    uniqueness: true,
    length: { maximum: 255 },
    format: {
      with: VALID_EMAIL_REGEX,
      message: ' は正しい形式で入力してください' }
  validates :password,
    length: { minimum: 8 }

  has_secure_password
  
end