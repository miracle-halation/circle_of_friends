require 'rails_helper'

RSpec.describe 'Circles', type: :system do
  let(:user) { FactoryBot.create(:user) }
  describe '新規立ち上げ' do
    context '成功する時' do
      it '入力値が全て正しいと登録できる' do
        login(user)
        visit new_circle_path
        fill_in 'circle_name', with: 'circle'
        fill_in 'circle_description', with: 'circle_description'
        select 'スポーツ', from: 'circle[genre_id]'
        select '毎週', from: 'circle[activity_id]'
        select '20代が多い', from: 'circle[age_range_id]'
        select '北海道', from: 'circle[prefecture_id]'
        expect do
          find("input[name='commit']").click
        end.to change { Circle.count }.by(1)
        expect(current_path).to eq root_path
      end
    end
    context '失敗する時' do
      it 'ログインしていないとログインページへ遷移する' do
        visit new_circle_path
        expect(current_path).to eq new_user_session_path
      end
      it '入力値が正しくないとエラーが表示される' do
        login(user)
        visit new_circle_path
        expect do
          find("input[name='commit']").click
        end.to change { Circle.count }.by(0)
        expect(page).to have_content "Name can't be blank"
      end
    end
  end

  describe 'サークル一覧' do
    let(:user_circle) { FactoryBot.create(:user_circle) }
    before do
      login(user_circle.user)
    end

    it 'トップページにサークル名が表示されている' do
      expect(page).to have_content user_circle.circle.name
    end
  end

  describe 'サークル詳細' do
    let(:user_circle) { FactoryBot.create(:user_circle) }
    before do
      login(user_circle.user)
    end

    it '新規登録の時に登録した情報が全て表示されている' do
      visit circle_path(user_circle.circle)
      expect(page).to have_content user_circle.circle.name
      expect(page).to have_content user_circle.circle.description
      expect(page).to have_content user_circle.circle.genre.name
      expect(page).to have_content user_circle.circle.activity.name
      expect(page).to have_content user_circle.circle.age_range.name
      expect(page).to have_content user_circle.circle.prefecture.name
    end
  end
end
