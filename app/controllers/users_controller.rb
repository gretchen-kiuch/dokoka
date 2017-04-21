class UsersController < ApplicationController
  def dashboard
    redirect_to products_path if current_user.branch_manager?
  end

  def admins
    @admins = User.where(account_type: "admin")
  end

  private

  def user_params
    params.require(:user)
  end
end
