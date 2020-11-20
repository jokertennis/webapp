require "json"

class ProductsController < ApplicationController
	#指定された商品のページを表示する
	def show
		if params[:title] then
			@product = Product.find_by(title: params[:title])
			@hash_genres = JSON.parse(@product.genres)
			@hash_production_companies = JSON.parse(@product.production_companies)
			@hash_production_countries = JSON.parse(@product.production_countries)
			@hash_spoken_languages = JSON.parse(@product.spoken_languages)
			@reviews = @product.reviews.all()
		end
	end
end
