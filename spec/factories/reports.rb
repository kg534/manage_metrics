FactoryBot.define do
  factory :report do
    active_date { Date.today }
    order { 3 }
    phone { 10 }
    visit { 5 }
    negotiate { 5 }
    good_thing { 'レポート機能のテスト' }
    problem { '改善点のテスト' }
    goal { '目標のテスト' }
    user
  end
end
