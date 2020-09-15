require "date"

class SearchController < ApplicationController
	layout "searajioajo_layout"
	protect_from_forgery with: :exception
	def initialize 
		@movies = Array.new
		@genres = Array.new
	end
	#検索方法を選択させ、クリックしたら飛ぶようにする。
	def index
	end
	def title_search
		@msg = "映画を検索してください。タイトルは英語で入力してください。"
		if params[:title] then
			@movies = Search.where "title like ?",
			'%' + params[:title].to_s + '%'
		end
	end
	def release_date_search
		@msg = "映画の公開年を選択してください。"
		if params[:year] then
			#文字列として日付を扱っている。
			@movies = Search.where "release_date like ?",
			params[:year].to_s + '%'
		end
	end
	def genres_search
		@msg = "映画のジャンルを選択してください。"
		@genres = ["Animation","Action","Comedy","Crime","Documentary","Drama","Family","Fantasy","Foreign","History",
			"Honnor","Music","Mystery","Romance","Science Fiction","Thriller","TV Movie","War","Western"]
		if params[:genres] then
			#データは文字列型なので、文字列に含まれるgenresを抽出するようにした。
			@movies = Search.where "genres like ?",
			'%' + params[:genres] + '%'
		end
	end
end
