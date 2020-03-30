# frozen_string_literal: true

class MemosController < ApplicationController
  before_action :set_target_memo, only: %i[edit update destroy]

  def index
    @memos = Memo.all
  end

  def new
    @memo = Memo.new(flash[:memo])
  end

  def create
    memo = Memo.new(memo_params)
    if memo.save
      flash[:success] = "「#{memo.title}」のメモを作成しました"
      redirect_to root_path
    else
      redirect_to new_memo_path, flash: {
        memo: memo,
        error_messages: memo.errors.full_messages
      }
    end
  end

  def destroy
    @memo.destroy
    redirect_to root_path, flash: { success: "「#{@memo.title}」のメモが削除されました" }
  end

  def edit; end

  def update
    if @memo.update(memo_params)
      flash[:success] = "「#{@memo.title}」のメモを編集しました"
      redirect_to root_path
    else
      redirect_back fallback_location: root_path, flash: {
        user: @memo,
        error_messages: @memo.errors.full_messages
      }
    end
  end

  private

  # ストロングパラメータ
  def memo_params
    params.require(:memo).permit(:title, :body, :category_id, :picture)
  end

  def set_target_memo
    @memo = Memo.find(params[:id])
  end
end
