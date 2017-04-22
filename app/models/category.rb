class Category < ActiveRecord::Base
  validates :name, presence: true

  has_many :products

  validates :name, presence: true
end
