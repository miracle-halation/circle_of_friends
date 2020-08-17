require 'rails_helper'

RSpec.describe User, type: :model do
  describe "新規登録" do
    let(:user){FactoryBot.build(:user)}

    context "登録に成功する時" do
      it "情報が全て正しいと登録できる" do
        expect(user).to be_valid
      end
    end
    context "登録に失敗する時" do
      it "nicknameが空だと登録できない" do
        user.nickname = nil
        user.valid?
        expect(user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        user.email = nil
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空だと登録できない" do
        user.password = nil
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
      end
      it "password_confirmationの値が違うと登録できない" do
        user.password_confirmation = "a" * 6
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
