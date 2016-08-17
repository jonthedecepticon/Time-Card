FactoryGirl.define do
  sequence :email do |num|
    "johnnyappleseed_#{num}@example.com"
  end

  factory :user do
    first_name "Clark"
    last_name "Kent"
    email { generate :email }
    password "password"
    password_confirmation "password"
  end

  factory :admin_user, class: "AdminUser" do
    first_name "Clark"
    last_name "Kent"
    email { generate :email }
    password "password"
    password_confirmation "password"
  end
end
