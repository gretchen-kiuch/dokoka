class AddBranchIdToUser < ActiveRecord::Migration
  def change
    add_reference :users, :branch, index: true, foreign_key: true
  end
end
