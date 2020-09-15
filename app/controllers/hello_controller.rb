class HelloController < ApplicationController
	layout 'application'
	#メソッド名にindexを使用しているのは、デフォルトアドレスでindexが主に使用されるからである。
	before_action :authenticate_account!,only: :login_check

	def index
	end

	def login_check
		@msg = 'アカウントが作成されました。'
	end
end
