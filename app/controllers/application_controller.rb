# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :authenticate_user!  # これが正しい位置

  # その他のメソッド
end
