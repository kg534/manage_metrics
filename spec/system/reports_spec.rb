require 'rails_helper'

describe 'レポート管理機能', type: :system do
  let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
  let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }
  let!(:report_a) { FactoryBot.create(:report, good_thing: '最初のレポート', user: user_a) }
  
  before do
    visit login_path
    fill_in 'メールアドレス', with: login_user.email
    fill_in 'パスワード', with: login_user.password
    click_button 'ログインする'
  end

  shared_examples_for 'ユーザーAが作成したレポートが表示される' do
    it { expect(page).to have_content '最初のレポート' }
  end

  describe '一覧表示機能' do
    before do
      visit reports_path
    end

    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }
      
      it_behaves_like 'ユーザーAが作成したレポートが表示される'
    end

    context 'ユーザーBがログインしているとき' do
      let(:login_user) { user_b }

      it 'ユーザーAが作成したレポートが表示されない' do
        expect(page).to have_no_content '最初のレポート'
      end
    end
  end

  describe '詳細表示機能' do
    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }

      before do
        visit report_path(report_a)
      end

      it_behaves_like 'ユーザーAが作成したレポートが表示される'
    end
  end

  describe '新規登録機能' do
    let(:login_user) { user_a }

    before do
      visit new_report_path
      fill_in "report_order", with: report_order
      click_button "submit--btn__report"
    end

    context '新規作成画面で受注実績を入力したとき' do
      let(:report_order) { 10 }

      it '正常に登録される' do
        expect(current_path).to eq reports_path
      end
    end

    context '受注実績を入力しなかったとき' do
      let(:report_order) { '' }

      it 'エラーとなる' do
        within '#error_explanation' do
          expect(page).to have_content "Orderを入力してください"
        end
      end
    end
  end

  describe '編集更新機能' do
    let(:login_user) { user_a }

    before do
      visit edit_report_path(report_a)
      fill_in "report_order", with: report_order
      click_button "submit--btn__report"
    end

    context '編集更新画面で受注実績を更新したとき' do
      let(:report_order) { 15 }

      it '正常に更新される' do
        expect(current_path).to eq reports_path 
      end
    end
  end

  describe '削除機能' do
    let(:login_user) { user_a }

    before do
      visit report_path(report_a)
      click_link('削除')
    end

    it 'レポートを削除' do
      expect(page).to have_no_content '最初のレポート'
    end
  end
end