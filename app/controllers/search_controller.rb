class SearchController < ApplicationController
	protect_from_forgery with: :exception

	#配列を各メソッドで定義するのはコードの重複になるので、定義している。
	def initialize
		#データベースから取り出した映画を格納するための配列
		@movies = Array.new
	end

	#検索方法を選択させ、クリックしたら飛ぶようにする。
	def index
	end

	#検索スペースからタイトルを入力させ、検索されたタイトルが含まれる映画をデータベースから取り出す。
	def title_search
		@msg = "映画を検索してください。タイトルは英語で入力してください。"
		if params[:title] then
			@movies = Search.where "title like ?",
			'%' + params[:title].to_s + '%'
			@msg = @movies.length.to_s + "件の映画データが該当しました。"
		end
	end

	#ユーザが指定した公開年に該当する映画データを取り出す。
	def release_date_search
		@msg = "映画の公開年を選択してください。"
		if params[:year] then
			#文字列として日付を扱っている。
			@movies = Search.where "release_date like ?",
			params[:year].to_s + '%'
			@msg = @movies.length.to_s + "件の映画データが該当しました。"
		end
	end

	#ユーザが指定したジャンルに該当する映画データを取り出す。
	def genres_search
		@msg = "映画のジャンルを選択してください。"
		@genres = ["Animation","Action","Comedy","Crime","Documentary","Drama","Family","Fantasy","Foreign","History",
			"Honnor","Music","Mystery","Romance","Science Fiction","Thriller","TV Movie","War","Western"]
		if params[:genres] then
			#データは文字列型なので、文字列に含まれるgenresを抽出するようにした。
			@movies = Search.where "genres like ?",
			'%' + params[:genres] + '%'
			@msg = @movies.length.to_s + "件の映画データが該当しました。"
		end
	end
end
