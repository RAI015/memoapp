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
require 'test_helper'

class MemoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
