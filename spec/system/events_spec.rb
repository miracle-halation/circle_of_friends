require 'rails_helper'

RSpec.describe 'Events', type: :system do
  let!(:user_event) { FactoryBot.create(:user_event) }
  let(:user) { FactoryBot.create(:user) }
  before do
    user_event.event.circle.leader_user = user_event.user
    user_event.event.circle.users << user_event.user
  end

  describe '新規作成' do
    context '失敗する時' do
      it 'ログインしていないとログインページへ遷移する' do
        visit new_circle_event_path(user_event.event.circle)
        expect(current_path).to eq new_user_session_path
      end
      it 'サークルに所属しているユーザーでないとトップページへ遷移する' do
        login(user)
        visit new_circle_event_path(user_event.event.circle)
        expect(current_path).to eq root_path
      end
      it '入力値が正しくないと保存できない' do
        login(user_event.user)
        visit new_circle_event_path(user_event.event.circle)
        fill_in 'event_title', with: ''
        fill_in 'event_body', with: ''
        fill_in 'event_start_time', with: ''
        fill_in 'event_end_time', with: ''
        expect do
          find("input[name='commit']").click
        end.to change { Event.count }.by(0)
      end
    end
    context '成功する時' do
      it '入力値が正しいと保存できてサークル詳細ページへ遷移する' do
        login(user_event.user)
        visit new_circle_event_path(user_event.event.circle)
        fill_in 'event_title', with: 'Event Title'
        fill_in 'event_body', with: 'Event Body'
        fill_in 'event_start_time', with: 1.hour.ago
        fill_in 'event_end_time', with: Time.now
        expect do
          find("input[name='commit']").click
          expect(page).to have_content('Event Title')
        end.to change { Event.count }.by(1)
        expect(current_path).to eq circle_path(user_event.event.circle)
      end
    end
  end

  describe 'イベント詳細機能' do
    context '失敗する時' do
      it 'ログインしていないとログインページへ遷移する' do
        visit circle_event_path(user_event.event.circle, user_event.event)
        expect(current_path).to eq new_user_session_path
      end
      it 'サークルに所属しているユーザーでないとトップページへ遷移する' do
        login(user)
        visit circle_event_path(user_event.event.circle, user_event.event)
        expect(current_path).to eq root_path
      end
    end
    context '成功する時' do
      it '登録した情報が表示されている' do
        login(user_event.user)
        visit circle_event_path(user_event.event.circle, user_event.event)
        expect(page).to have_content user_event.event.title
        expect(page).to have_content user_event.event.body
        expect(page).to have_content user_event.event.start_time.strftime('%Y/%m/%d %H:%M:%S')
        expect(page).to have_content user_event.event.end_time.strftime('%Y/%m/%d %H:%M:%S')
      end
    end
  end

  describe 'イベント編集機能' do
    context '失敗する時' do
      it 'ログインしていないとログインページへ遷移する' do
        visit edit_circle_event_path(user_event.event.circle, user_event.event)
        expect(current_path).to eq new_user_session_path
      end
      it 'サークルに所属しているユーザーでないとトップページへ遷移する' do
        login(user)
        visit edit_circle_event_path(user_event.event.circle, user_event.event)
        expect(current_path).to eq root_path
      end
      it '入力値が正しくないと編集できない' do
        login(user_event.user)
        visit edit_circle_event_path(user_event.event.circle, user_event.event)
        fill_in 'event_title', with: ''
        fill_in 'event_body', with: ''
        fill_in 'event_start_time', with: ''
        fill_in 'event_end_time', with: ''
        expect do
          find("input[name='commit']").click
        end.to change { Event.count }.by(0)
        expect(current_path).to eq edit_circle_event_path(user_event.event.circle, user_event.event)
      end
    end
    context '成功する時' do
      it '値が正しいと編集に成功してイベント詳細ページへ遷移する' do
        login(user_event.user)
        visit edit_circle_event_path(user_event.event.circle, user_event.event)
        fill_in 'event_title', with: 'Update Event'
        fill_in 'event_body', with: 'Update Body'
        expect do
          find("input[name='commit']").click
          expect(page).to have_content('Update Event')
          expect(page).to have_content('Update Body')
        end.to change { Event.count }.by(0)
        expect(current_path).to eq circle_event_path(user_event.event.circle, user_event.event)
      end
    end
  end

  describe '出欠席機能' do
    context '失敗する時' do
      it 'サークルに所属していないユーザーだとトップページへ遷移する' do
        login(user)
        visit circle_event_attend_path(user_event.event.circle, user_event.event)
        expect(current_path).to eq root_path
      end
    end
    context '成功する時' do
      it '出席状態になるとイベント詳細ページに自分の名前が表示される' do
        login(user)
        user_event.event.circle.users << user
        visit circle_event_path(user_event.event.circle, user_event.event)
        within(:css, '.list-group') do
          expect(page).to have_no_content user.nickname
        end
        expect do
          click_link('出欠登録')
          sleep(1)
        end.to change { user_event.event.users.count }.by(1)
        within(:css, '.list-group') do
          expect(page).to have_content user.nickname
        end
      end
      it '欠席状態になるとイベント詳細ページに自分の名前が表示される' do
        login(user_event.user)
        visit circle_event_path(user_event.event.circle, user_event.event)
        within(:css, '.list-group') do
          expect(page).to have_content user_event.user.nickname
        end
        expect do
          click_link('出欠登録')
          sleep(1)
        end.to change { user_event.event.users.count }.by(-1)
        within(:css, '.list-group') do
          expect(page).to have_no_content user_event.user.nickname
        end
      end
    end
  end
end
