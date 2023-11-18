FactoryBot.define do
  factory :user do
    name { 'MyString' }
    photo { 'MyString' }
    bio { 'MyText' }
    updated_at { '2023-11-18 17:02:42' }
    created_at { '2023-11-18 17:02:42' }
    posts_counter { 1 }
  end
end
