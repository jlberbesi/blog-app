FactoryBot.define do
  factory :comment do
    text { 'MyText' }
    updated_at { '2023-11-18 16:42:13' }
    created_at { '2023-11-18 16:42:13' }
    user { nil }
    post { nil }
  end
end
