require 'rails_helper'

RSpec.describe Review, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context "感想のタイトルがない場合" do
  	it "無効な状態を返す" do
  		review = Review.new(
  			title: nil,
  			)

  		review.valid?

  		expect(review.errors["title"]).to include("を入力してください")
  	end
  end

  context "レビューがない場合" do
  	it "無効な状態を返す" do
  		review = Review.new(
  			review: nil,
  			)

  		review.valid?

  		expect(review.errors["review"]).to include("を入力してください")
  	end
  end
end
