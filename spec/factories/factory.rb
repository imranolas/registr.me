FactoryGirl.define do
  factory :user do |f|
    f.password "password"
    f.password_confirmation { |u| u.password }
    f.sequence(:email) { |n| "foo#{n}@example.com" }
  end

  factory :user_without_password, class: User do |f|
    f.sequence(:email) { |n| "foo#{n}@example.com" }
  end

  factory :student do |f|
    f.sequence(:name) { |n| "student ##{n}"}
  end

  factory :klass do |f|
    f.sequence(:name) { |n| "Class ##{n}"}
    f.attendance sample(50..100)
  end

end