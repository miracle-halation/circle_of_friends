require 'rails_helper'

RSpec.describe Circle, type: :model do
  describe '新規登録' do
    let(:circle) { FactoryBot.build(:circle) }
    context '成功する時' do
      it '全ての情報が正しければ登録できる' do
        expect(circle).to be_valid
      end
    end
    context '失敗する時' do
      it 'nameが空だと登録できない' do
        circle.name = nil
        circle.valid?
        expect(circle.errors.full_messages).to include("Name can't be blank")
      end
      it 'phraseが空だと登録できない' do
        circle.phrase = nil
        circle.valid?
        expect(circle.errors.full_messages).to include("Phrase can't be blank")
      end
      it 'descriptionが空だと登録できない' do
        circle.description = nil
        circle.valid?
        expect(circle.errors.full_messages).to include("Description can't be blank")
      end
      it 'genre_idが空だと登録できない' do
        circle.genre_id = nil
        circle.valid?
        expect(circle.errors.full_messages).to include("Genre can't be blank")
      end
      it 'genre_idが1だと登録できない' do
        circle.genre_id = 1
        circle.valid?
        expect(circle.errors.full_messages).to include('Genre must be other than 1')
      end
      it 'activityが空だと登録できない' do
        circle.activity = nil
        circle.valid?
        expect(circle.errors.full_messages).to include("Activity can't be blank")
      end
      it 'age_rangeが空だと登録できない' do
        circle.age_range = nil
        circle.valid?
        expect(circle.errors.full_messages).to include("Age range can't be blank")
      end
      it 'prefecture_idが空だと登録できない' do
        circle.prefecture_id = nil
        circle.valid?
        expect(circle.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1だと登録できない' do
        circle.prefecture_id = 1
        circle.valid?
        expect(circle.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityが空だと登録できない' do
        circle.city = nil
        circle.valid?
        expect(circle.errors.full_messages).to include("City can't be blank")
      end
    end
  end
end
