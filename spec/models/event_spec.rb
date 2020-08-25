require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "新規登録" do
    let(:event){FactoryBot.build(:event)}
    it "全ての情報が正しいと保存できる" do
      expect(event).to be_valid
    end
    it "titleが空だと保存できない" do
      event.title = nil
      event.valid?
      expect(event.errors.full_messages).to include("Title can't be blank")
    end
    it "bodyが空だと保存できない" do
      event.body = nil
      event.valid?
      expect(event.errors.full_messages).to include("Body can't be blank")
    end
    it "start_timeが空だと保存できない" do
      event.start_time = nil
      event.valid?
      expect(event.errors.full_messages).to include("Start time can't be blank")
    end
    it "end_timeが空だと保存できない" do
      event.end_time = nil
      event.valid?
      expect(event.errors.full_messages).to include("End time can't be blank")
    end
    it "circleと紐づいていないと保存できない" do
      event.circle = nil
      event.valid?
      expect(event.errors.full_messages).to include("Circle must exist")
    end
  end
end
