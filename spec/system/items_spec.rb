require 'rails_helper'

def visit_with_http_auth(path)
  username = ENV["BASIC_AUTH_USER"]
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe "商品登録", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:items_tag)
  end
  context '商品が投稿できるとき' do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      visit_with_http_auth new_user_session_path
      fill_in 'Nickname', with: @user.nickname
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq user_path(id: @user.id)
      # 商品投稿ページへのリンクがあることを確認する
      find('div[id="menus"]').click
      expect(page).to have_content('投稿する')
      # 投稿ページに移動する
      visit new_item_path
      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/sample.jpg')
      # 画像選択フォームに画像を添付する
      attach_file('items_tag[image]', image_path)
      # フォームに情報を入力する
      fill_in 'item-price', with: @item.price
      fill_in 'item-number', with: @item.number
      fill_in 'input-tag', with: @item.name
      fill_in 'item-text', with: @item.text
      # 「登録する」ボタンを押すとItemモデルのカウントがそれぞれ1上がる
      expect{
        find('input[name="commit"]').click
      }.to change { Item.count }.by(1)
      # ユーザーページに遷移する
      expect(current_path).to eq user_path(id: @user.id)
      # ユーザーページに先ほど投稿した商品が存在することを確認する
      expect(page).to have_selector("img")
    end
  end
  context '商品が投稿できないとき' do
    it 'ログインしていないと投稿ページに遷移してもトップページへ戻される' do
      # 投稿ページへ遷移する
      visit_with_http_auth new_item_path
      # トップページへ戻される
      expect(current_path).to eq root_path
    end
  end
end
