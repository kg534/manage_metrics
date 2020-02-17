FactoryBot.define do
  factory :task do
    name { 'テストタスク' }
    description { 'RSpec&Capybara&FactoryBotを準備する' }
    user
    start_time { '2020-02-25 00:07:00' }
    complete { '1' }
  end
end