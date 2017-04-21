class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :account_type, presence: true

  ACCOUNT_TYPE = %w(customer branch_manager admin)

  ACCOUNT_TYPE.each do |account_type|
    define_method "#{account_type}?" do
      self.account_type == account_type
    end
  end
end
