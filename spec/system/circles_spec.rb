require 'rails_helper'

RSpec.describe 'Circles', type: :system do
  let!(:user) { FactoryBot.create(:user) }
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

  describe 'サークル編集' do
    let(:user_circle) { FactoryBot.create(:user_circle) }

    context '失敗する時' do
      it 'ログインしていないとログインページへ遷移する' do
        visit edit_circle_path(user_circle.circle)
        expect(current_path).to eq new_user_session_path
      end

      it 'ログインしているユーザーがリーダーでないとトップページに遷移する' do
        login(user_circle.user)
        user_circle.circle.leader_user = user
        visit edit_circle_path(user_circle.circle)
        expect(current_path).to eq root_path
      end

      it '値が正しくないと更新できない' do
        login(user_circle.user)
        user_circle.circle.leader_user = user_circle.user
        visit edit_circle_path(user_circle.circle)
        fill_in 'circle_name', with: ''
        expect do
          find("input[name='commit']").click
        end.to change { Circle.count }.by(0)
        expect(page).to have_content "Name can't be blank"
      end
    end
    context '成功する時' do
      it 'ログインしているユーザーがリーダーかつ値が正しいと更新できる' do
        login(user_circle.user)
        user_circle.circle.leader_user = user_circle.user
        visit edit_circle_path(user_circle.circle)
        fill_in 'circle_name', with: 'circle'
        check "circle_user_ids_#{user.id}"
        expect do
          find("input[name='commit']").click
        end.to change { Circle.count }.by(0)
        expect(current_path).to eq circle_path(user_circle.circle)
        expect(page).to have_content 'circle'
      end
    end
  end

  describe '削除機能' do
    let(:user_circle) { FactoryBot.create(:user_circle) }
    before do
      login(user_circle.user)
      user_circle.circle.leader_user = user_circle.user
    end

    it 'リーダーであるなら削除ボタンがあり、サークルを削除してトップページに遷移する' do
      visit circle_path(user_circle.circle)
      expect do
        find_link('削除', href: circle_path(user_circle.circle)).click
        page.driver.browser.switch_to.alert.accept
        sleep(1)
      end.to change { Circle.count }.by(-1)
      expect(current_path).to eq root_path
    end
  end

  describe "加入機能" do
    let(:user_circle) { FactoryBot.create(:user_circle) }
    context "失敗する時" do
      it "ログインしていないとログインページに遷移する" do
        visit circle_joing_path(user_circle.circle)
        expect(current_path).to eq new_user_session_path
      end
      it "すでに加入していれば、トップページに遷移する" do
        login(user)
        user_circle.circle.users << user
        visit circle_joing_path(user_circle.circle)
        expect(current_path).to eq root_path
      end
    end
    context "成功する時" do
      it "詳細ページから加入すると押すと加入して詳細ページへ遷移する" do
        login(user)
        visit circle_path(user_circle.circle)
        expect do
          click_on "加入"
          sleep(1)
        end.to change {user_circle.circle.users.count}.by(1)
        expect(page).to have_content user.nickname
        expect(page).to have_content "退会"
      end
    end
  end

  describe "退会機能" do
    let(:user_circle) { FactoryBot.create(:user_circle) }
    context "失敗する時" do
      it "ログインしていないとログインページに遷移する" do
        visit circle_withdrawal_path(user_circle.circle)
        expect(current_path).to eq new_user_session_path
      end
      it "加入していない状態だとトップページに遷移する" do
        login(user)
        visit circle_withdrawal_path(user_circle.circle)
        expect(current_path).to eq root_path
      end
    end
    context "成功する時" do
      it "詳細ページから退会を押すとトップページに遷移する" do
        login(user)
        user_circle.circle.users << user
        visit circle_path(user_circle.circle)
        expect do
          click_on "退会"
          sleep(1)
        end.to change {user_circle.circle.users.count}.by(-1)
        expect(current_path).to eq root_path
      end
    end
  end
end
