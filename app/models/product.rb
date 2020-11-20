class Product < ApplicationRecord
	self.primary_key = "id"
	has_many :reviews
end
