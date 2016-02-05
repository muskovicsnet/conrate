FactoryGirl.define do
  factory :blog, class: Conrateblogs::Blog do
    title { generate :title }
    description { generate :description }
  end

  sequence :title do |n|
    "Webnaplóm #{n}."
  end

  sequence :description do |n|
    "Ez egy leírása a webnaplónak, a száma: #{n}."
  end
end
