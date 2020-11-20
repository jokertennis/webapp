class Account < ApplicationRecord
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :validatable
	has_one :cart
	has_many :reviews
end
