class CartsController < ApplicationController
	protect_from_forgery with: :exception
	before_action :authenticate_account!
	before_action :current_cart, only: [:add_item,:delete_item]
	before_action :set_up_item!, only: [:add_item,:delete_item]
	def initialize
		@cart_items = Array.new
		@purchased_items = Array.new
	end

	def current_cart
		if current_account.cart.nil?
			@cart = Cart.create(account_id: current_account.id)
		else
			@cart = Cart.find(current_account.cart.id)
		end
	end

	#カートの中の商品を見るときのアクション。過去の購入履歴も表示。
	def show
		@count = 0
		@cart_items = current_cart.cart_items.all()
		@cart_purchased_items = current_cart.cart_purchased_items.all()
		@msg = "!!以前に購入された商品がカートに入っている場合、削除してください!!"
	end

	#カートに商品を追加する。
	def add_item
		if @cart_item.blank?
			@cart_item = current_cart.cart_items.create(cart_item_params)
		end
		redirect_to carts_show_path
	end

	#カートの商品を削除する
	def delete_item
		if params[:title]
			@cart_item = current_cart.cart_items.find_by(title: params[:title])
			@cart_item.destroy
		end
		redirect_to carts_show_path
	end

	#カートの商品を購入する。購入された商品の配列に格納し、元々存在していた商品の配列を空にする。
	def purchase_item
		@cart_items = current_cart.cart_items.all()
		@cart_purchased_items = current_cart.cart_purchased_items.all()
		for item in @cart_items
			@cart_purchased_item = current_cart.cart_purchased_items.create(title: item.title)
			@cart_item = current_cart.cart_items.find_by(title: item.title)
			@cart_item.destroy
		end
		redirect_to carts_purchased_show_path
	end

	def purchased_show
		@msg = "ご購入いただきありがとうございます!"
	end

	#商品がすでにカートの中にあるか確かめている。
	def set_up_item!
		@cart_items = current_cart.cart_items
		if @cart_items.present?
			@cart_item = current_cart.cart_items.find_by(cart_item_params)
		end
	end

	private
	def cart_item_params
		{ title: params[:title]}
	end
end
