class CreateProduct < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :price
      t.text :details
      t.binary :image
      t.boolean :available, default: true
      t.references :category, index: true, foreign_key: true
      t.references :branch, index: true, foreign_key: true
    end
  end
end
