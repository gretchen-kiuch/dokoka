class Store < ActiveRecord::Base
  has_many :branches

  validates :name, presence: true
end
