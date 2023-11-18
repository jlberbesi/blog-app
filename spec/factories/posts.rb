FactoryBot.define do
  factory :post do
    title { 'MyString' }
    text { 'MyText' }
    created_at { '2023-11-18 16:40:57' }
    updated_at { '2023-11-18 16:40:57' }
    comments_counter { 1 }
    likes_counter { 1 }
    author { nil }
  end
end
