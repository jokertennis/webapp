class CartsController < ApplicationController
	protect_from_forgery with: :exception
	before_action :authenticate_account!
	before_action :set_up_item!, only: [:add_item,:delete_item]

	#配列を各メソッドで定義するのはコードの重複になるので、定義している。
	def initialize
		#購入予定の商品を格納
		@cart_items = Array.new
		#購入済みの商品を格納
		@cart_purchased_items = Array.new
	end

	#カートを作成する。ユーザがカートを保有している場合は、そのカートを利用する。
	def current_cart
		if current_account.cart.nil?
			@cart = Cart.create(account_id: current_account.id)
		else
			@cart = current_account.cart
		end
	end

	#カートの中の商品を見るときのアクション。過去の購入履歴も表示。
	def show
		@cart_items = current_cart.cart_items.all()
		@cart_purchased_items = current_cart.cart_purchased_items.all()
		@msg = "!!以前に購入された商品がカートに入っている場合、削除してください!!"
	end

	#カートに商品を追加する。
	def add_item
		#カートに入れようとしている商品がカートになかった場合、商品をカートに入れる。
		if @cart_item.blank?
			current_cart.cart_items.create(cart_item_params)
		end
		redirect_to carts_show_path
	end

	#カートの商品を削除する
	def delete_item
		if params[:title]
			@cart_item = current_cart.cart_items.find_by(title: params[:title])
			@cart_item.destroy()
		end
		redirect_to carts_show_path
	end

	#カートの商品を購入する。購入された商品の配列に格納し、元々存在していた商品の配列を空にする。
	def purchase_item
		@cart_items = current_cart.cart_items.all()
		@cart_purchased_items = current_cart.cart_purchased_items.all()
		#カートに入っている商品を1つずつ処理していく。
		for item in @cart_items
			#購入済みの商品を追加している。
			current_cart.cart_purchased_items.create(title: item.title)
			#カートから商品を取り出したので、取り出した商品データを削除している。
			@cart_item = current_cart.cart_items.find_by(title: item.title)
			@cart_item.destroy()
		end
		redirect_to carts_purchased_show_path
	end

	def purchased_show
		@msg = "ご購入いただきありがとうございます!"
	end

	#商品がすでにカートの中にあるか確かめている。
	def set_up_item!
		#カート内の商品を配列に格納
		@cart_items = current_cart.cart_items.all()
		#カートに何らかの商品が入っている場合、指定された商品が元々カート内に入っているか確認している。
		#入っている場合、変数に商品データを格納する。
		if @cart_items.present?
			@cart_item = current_cart.cart_items.find_by(cart_item_params)
		end
	end

	private
	def cart_item_params
		{ title: params[:title]}
	end
end
