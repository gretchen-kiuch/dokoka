class Branch < ActiveRecord::Base
  has_many :users
  belongs_to :store

  delegate :name, prefix: true, allow_nil: true, to: :store

  validates :name, :store_id, presence: true
end
