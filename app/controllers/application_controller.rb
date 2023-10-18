class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end
end
