Rails.application.routes.draw do
	root 'top#index'
	get '/top/finish'
	get '/home/index'
	get '/home', to: 'home#index'
	get '/home/introduce' => 'home#introduce'
	get 'hello/index'
	get 'hello', to:'hello#index'
	get 'hello/login_check'

	devise_for :accounts, :controllers => {
		:registrations => 'accounts/registrations',
		:sessions => 'accounts/sessions'
	}

	devise_scope :account do
		get '/accounts/sign_out' => 'devise/sessions#destroy'
	end

	resources :products,param: :title
	resources :reviews,param: :product_id
	get '/carts/show' => 'carts#show'
	get '/carts/purchased_show' => 'carts#purchased_show'
	post '/carts/add_item' => 'carts#add_item'
	post '/carts/update_item' => 'carts#update_item'
	delete '/carts/delete_item' => 'carts#delete_item'
	post '/carts/purchase_item' => 'carts#purchase_item'

	get 'search/index' => 'search#index'
	get 'search' => 'search#index'
	get '/search/title_search' => 'search#title_search'
	get '/search/release_date_search' => 'search#release_date_search'
	get '/search/genres_search' => 'search#genres_search'
end
