# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      remember user
      flash[:success] = 'ログインしました'
      redirect_to mypage_path
    else
      # flash[:success].now = "ログインに失敗しました"
      render :new
      # redirect_back fallback_location: root_path
      # パスワードが正しくありませんなど
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = 'ログアウトしました'
    redirect_to root_path
  end
end
