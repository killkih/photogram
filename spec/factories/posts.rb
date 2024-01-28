# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    body { 'MyString' }
    content { 'https://icdn.lenta.ru/images/2021/04/27/16/20210427163138131/square_320_c09ebae17387b7d6eeb9fa0d42afe5ee.jpg' }
    association :user, factory: :user

    trait :invalid do
      content { nil }
    end
  end
end
