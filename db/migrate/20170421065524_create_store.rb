class CreateStore < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.boolean :active, default: true
    end
  end
end
