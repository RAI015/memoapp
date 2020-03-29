class AddPictureToMemos < ActiveRecord::Migration[5.2]
  def change
    add_column :memos, :picture, :string
  end
end
