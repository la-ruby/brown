FactoryBot.define do
  factory :user do
    email { FIRST_USER_EMAIL }
    password { FIRST_USER_PASSWORD }
  end
end
