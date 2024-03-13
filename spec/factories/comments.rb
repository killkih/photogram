FactoryBot.define do
  factory :comment do
    body {'test test'}
    association :user, factory: :user
    association :post, factory: :post

    trait :invalid do
      body { nil }
    end
  end
end
