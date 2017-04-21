class AddUserIdToBranch < ActiveRecord::Migration
  def change
    add_reference :branches, :user, index: true, foreign_key: true
  end
end
