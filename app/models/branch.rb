class Branch < ActiveRecord::Base
  has_many :users
  belongs_to :store

  delegate :name, prefix: true, to: :store

  validates :name, presence: true
end
