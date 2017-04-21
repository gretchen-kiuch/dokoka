class CreateBranch < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :phone_number
      t.references :store, index: true, foreign_key: true
    end
  end
end
