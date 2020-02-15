FactoryBot.define do
  factory :task do
    name { 'テストタスク' }
    description { 'RSpec&Capybara&FactoryBotを準備する' }
    end_time { '2020-01-20 22:14:00' }
    complete { '1' }
    user
  end
end