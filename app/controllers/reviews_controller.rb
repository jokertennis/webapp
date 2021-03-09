class ReviewsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_account!

  def index
    @reviews = Review.all
  end

  def current_product
    #まずはハッシュ化する。そして、文字列型で送信されているので、数値型に変換して親モデルのデータを抽出している。
    @product_id_hash = params.require(:review).permit(:product_id).to_h
    @product = Product.find_by(id: @product_id_hash["product_id"].to_i)
    return @product
  end

  # GET /reviews/new
  def new
    #urlから得たproduct_idの値をformの隠れフォームで送信するために利用する。
    @product_id = request.query_parameters["product_id"]
    @review = Review.new
  end

  # POST /reviews
  # POST /reviews.json
  def create
    #レビューを作成
    @review = Review.create(review_params)
    #感想を投稿しましたというメッセージを表示するページへ飛ぶようにする(redirect_toの利用。)
    redirect_to top_finish_path
  end

  private
    # reviewテーブルのパラメータ
    def review_params
      { product_id: current_product.id,account_id: current_account.id,
        title: params.require(:review).permit(:title),
        review: params.require(:review).permit(:review)}
    end
end
