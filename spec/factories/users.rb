FactoryBot.define do
  factory :user do
    username { Faker::SiliconValley.character }
    password 'football'
  end
end
