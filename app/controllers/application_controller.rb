class ApplicationController < ActionController::Base
  before_action :get_category

  private
  def get_category
    @categories = Category.all
  end
end
