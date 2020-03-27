class CategoriesController < ApplicationController
  def show
    @memos = Memo.where(category_id: params[:id])
    @category = Category.find(params[:id])
  end
end
