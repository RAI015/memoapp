class ApplicationController < ActionController::Base
  before_action :current_user
  before_action :get_category

  private

  def current_user
    return unless session[:user_id]
    @current_user = User.find_by(id: session[:user_id])
  end

  def get_category
    @categories = Category.all
  end
end
