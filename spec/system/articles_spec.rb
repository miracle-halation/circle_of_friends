require 'rails_helper'

RSpec.describe 'Articles', type: :system do
  let!(:user_circle) { FactoryBot.create(:user_circle) }
  let!(:article) { FactoryBot.create(:article) }

  describe '新規記事作成' do
    context '失敗する時' do
      it 'ログインしていないと新規作成ページへアクセスできない' do
        visit new_circle_article_path(user_circle.circle)
        expect(current_path).to eq new_user_session_path
      end

      context 'ログインしているユーザーが所属していないサークルの時' do
        let(:user) { FactoryBot.create(:user) }
        it '新規記事作成ページにアクセスするとトップページへ遷移する' do
          login(user)
          visit new_circle_article_path(user_circle.circle)
          expect(current_path).to eq root_path
        end
      end

      it '入力情報が空だと保存されない' do
        login(user_circle.user)
        visit new_circle_article_path(user_circle.circle)
        fill_in 'article[title]', with: ''
        fill_in_rich_text_area 'article_content', with: ''
        expect do
          find("input[name='commit']").click
        end.to change { Article.count }.by(0)
      end
    end
    context '成功する時' do
      it '全ての情報が正しいと保存されて、サークル詳細ページへ遷移する' do
        login(user_circle.user)
        visit new_circle_article_path(user_circle.circle)
        fill_in 'article[title]', with: 'article title'
        fill_in_rich_text_area 'article_content', with: 'article content'
        expect do
          find("input[name='commit']").click
          sleep(1)
        end.to change { Article.count }.by(1)
        expect(current_path).to eq circle_path(user_circle.circle)
      end
    end
  end

  describe '記事詳細ページ' do
    it '投稿した記事の内容が正しく表示されている' do
      login(article.user)
      visit circle_article_path(article.circle, article)
      expect(page).to have_content article.title
      expect(page).to have_selector "img[src$='test_image.jpg']"
    end
  end

  describe '記事編集機能' do
    context '失敗する場合' do
      it 'ログインしていないとログインページへ遷移する' do
        visit edit_circle_article_path(article.circle, article)
        expect(current_path).to eq new_user_session_path
      end

      it '作成した本人でないとトップページへ遷移する' do
        login(user_circle.user)
        visit edit_circle_article_path(article.circle, article)
        expect(current_path).to eq root_path
      end

      it '入力値が正しくないと更新できない' do
        login(article.user)
        visit edit_circle_article_path(article.circle, article)
        fill_in 'article[title]', with: ''
        fill_in_rich_text_area 'article_content', with: ''
        expect do
          find("input[name='commit']").click
        end.to change { Article.count }.by(0)
        expect(current_path).to eq edit_circle_article_path(article.circle, article)
      end
    end
    context '成功する場合' do
      it '入力値が正しいと編集できる' do
        login(article.user)
        visit edit_circle_article_path(article.circle, article)
        fill_in 'article[title]', with: 'update_title'
        fill_in_rich_text_area 'article_content', with: 'update_content'
        expect do
          find("input[name='commit']").click
        end.to change { Article.count }.by(0)
        expect(page).to have_content 'update_title'
        expect(page).to have_content 'update_content'
      end
    end
  end

  describe '記事削除機能' do
    context '失敗する場合' do
      
    end
    context '成功する場合' do
      
    end
  end
end
