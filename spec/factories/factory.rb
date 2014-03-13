FactoryGirl.define do
  factory :user do |f|
    f.password "password"
    f.password_confirmation { |u| u.password }
    f.sequence(:email) { |n| "foo#{n}@example.com" }
  end

  factory :user_without_password, class: User do |f|
    f.sequence(:email) { |n| "foo#{n}@example.com" }
  end
end