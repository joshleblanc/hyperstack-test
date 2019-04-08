class ApplicationController < ActionController::Base
  def acting_user
    current_user
  end
end
