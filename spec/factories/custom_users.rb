FactoryBot.define do
  factory :custom_user do
    name { 'MyString' }
    photo { 'MyString' }
    bio { 'MyText' }
    updated_at { '2023-11-18 17:14:54' }
    created_at { '2023-11-18 17:14:54' }
    posts_counter { 1 }
  end
end
