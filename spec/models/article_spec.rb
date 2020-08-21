require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "新規作成"  do
    let!(:article){FactoryBot.build(:article)}

    it "全ての情報が正しいと保存できる" do
      expect(article).to be_valid
    end
    it "titleが空だと保存できない" do
      article.title = nil
      article.valid?
      expect(article.errors.full_messages).to include("Title can't be blank")
    end
    it "contentが空だと保存できない" do
      article.content = nil
      article.valid?
      expect(article.errors.full_messages).to include("Content can't be blank")
    end
    it "imageが空でも保存できる" do
      article.image = nil
      expect(article).to be_valid
    end
    it "userと紐づいていないと保存できない" do
      article.user = nil
      article.valid?
      expect(article.errors.full_messages).to include("User must exist")
    end
    it "circleと紐づいていないと保存できない" do
      article.circle = nil
      article.valid?
      expect(article.errors.full_messages).to include("Circle must exist")
    end
  end
end
