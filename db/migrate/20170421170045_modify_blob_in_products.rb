class ModifyBlobInProducts < ActiveRecord::Migration
  def change
    change_column :products, :image, :binary, :limit => 10.megabyte
  end
end
