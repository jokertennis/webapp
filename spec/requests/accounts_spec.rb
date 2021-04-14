require 'rails_helper'

RSpec.describe "Accounts", type: :request do
　# ログイン機能のテスト
  describe "/accounts/sign_in" do
  	describe "GET /accounts/sign_in" do
  		it "正常なリクエストを返す" do
  			get new_account_session_path
  			expect(response).to have_http_status(200)
  		end
  	end

  	describe "POST /accounts/sign_in" do
  		describe "ログインが成功した場合" do
  			it "正常なリクエスト(ログインチェック完了画面)を返す" do
  			end
  		end

  		describe "ログインが失敗した場合" do
  			it "401エラーを返す" do
  			end
  		end

  # 新規会員登録機能のテスト
  describe "GET /accounts/sign_up" do
  	it "正常なリクエストを返す" do
  		get new_account_registration_path
  		expect(response).to have_http_status(200)
  	end
  end

  # 新規会員登録機能のテスト
  describe "POST /accounts/" do
  	describe "成功した場合" do
  		it "正常なリクエストを返す" do
  		end
  	end

  	describe "新規会員登録に失敗した場合" do
  		it "401エラーを返す" do
  		end
  	end

  # ログアウトのテスト
  describe "DELETE /accounts/sign_out" do
  	it "正常なリクエストを返す" do
  	end
  end
end
