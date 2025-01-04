# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  before_action :authenticate_user!  # これも正しい位置

  def index
    # indexアクションの処理
  end
end
