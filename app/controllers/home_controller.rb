class HomeController < ApplicationController
  def index
  end

  def admin
  end

  def admin_dashboard
    redirect_to new_user_session_path unless user_signed_in?
  end
end
