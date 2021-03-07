require 'rails_helper'

RSpec.describe Account, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context "名前、メール、パスワード、パスワード再入力がある場合" do
    it "有効な状態を返す" do
      account = Account.new(
        name: "テストユーザー",
        email: "test@example.com",
        password: "testpass",
        password_confirmation: "testpass",
        )
      expect(account).to be_valid
    end
  end

  context "名前がない場合" do
    it "無効な状態を返す" do
      account = Account.new(
        name: nil,
        )
      account.vaild?
      expect(account.errors[:name]).to include("を入力してください")
    end
  end

  context "メールアドレスがない場合" do
    it "無効な状態を返す。" do
      account = Account.new(
        email: nil,
        )
      account.vaild?
      expect(account.errors[:email]).to include("を入力してください")
    end
  end

  context "重複したメールアドレスである場合" do
    it "無効な状態を返す" do
      account1 = Account.create(
        name: "テストユーザー",
        email: "test@example.com",
        password: "testpass",
        password_confirmation: "testpass",
        )

      account2 = Account.new(
        email: "test@example.com",
        )

      account2.valid?
      expect(account2.errors[:email]).to include("はすでに存在します")
    end
  end

  context "パスワードがない場合" do
    it "無効な状態を返す" do
      account = Account.new(
        password: nil,
        )
      account.vaild?
      expect(account.errors[:password]).to include("を入力してください")
    end
  end

  context "パスワードが6文字未満である場合" do
    it "無効な状態を返す" do
      account = Account.new(
        password: "test",
        )
      account.vaild?
      expect(account.errors[:password]).to include("は6文字以上で入力してください")
    end
  end

  context "パスワード再入力がパスワードと一致しない場合" do
    it "無効な状態を返す" do
      account = Account.new(
        name: "テストユーザー",
        email: "test@example.com",
        password: "testpass",
        password_confirmation: nil,
        )
      account.vaild?
      expect(account.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end
  end
end
