class UsersController < ApplicationController
  def dashboard

  end

  def admins
    @admins = User.where(account_type: "admin")
  end

  private

  def user_params
    params.require(:user)
  end
end
