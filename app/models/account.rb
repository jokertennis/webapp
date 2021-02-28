class Account < ApplicationRecord
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :validatable
	# nameという項目に入力がされているかチェックしている。
	validates :name, presence: true
	has_one :cart
	has_many :reviews
end
