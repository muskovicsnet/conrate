FactoryGirl.define do
  factory :user, class: Conratesecurity::User do
    email { generate :email }
    # name { generate :name }
    password 'adminadmin'
    confirmed_at { Time.now }
  end

  sequence :name do |n|
    "Gipsz Jakab #{n}."
  end

  sequence :email do |n|
    "gipsz.jakab.#{n}@example.com"
  end
end
