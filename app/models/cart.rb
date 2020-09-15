class Cart < ApplicationRecord
	belongs_to :account
	has_many :cart_items
	has_many :cart_purchased_items
end
