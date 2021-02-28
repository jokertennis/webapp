require 'rails_helper'

RSpec.describe Cart, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "accountがカートを保有していない場合、accountのid情報をカートに持たせる" do
  	account = Account.create(
  		name: "テストユーザー",
  		email: "test@example.com",
  		password: "testpass",
  		password_confirmation: "testpass",
  		)

  	cart = Cart.new(
  		account_id: account.id
  		)

  	expect(cart).to be_valid
  end

  it "accountがカートを保有している場合、accountの子モデルであるカートを取り出す" do
  	account = Account.create(
  		name: "テストユーザー",
  		email: "test@example.com",
  		password: "testpass",
  		password_confirmation: "testpass",
  		)

  	cart = Cart.create(
  		account_id: account.id
  		)

  	account_cart = account.cart

  	expect(account_cart).to be_valid
  end
end
