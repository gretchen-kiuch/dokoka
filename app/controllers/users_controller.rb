class UsersController < ApplicationController
  def dashboard

  end

  private

  def user_params
    params.require(:user)
  end
end
