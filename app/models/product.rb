class Product < ActiveRecord::Base
  belongs_to :branch
  belongs_to :category

  validates :name, :price, :details, presence: true
end
