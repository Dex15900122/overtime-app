
FactoryGirl.define do
  sequence :email do |n|
    "12345#{n}@xxx.com"
  end

  factory :user do
    first_name "Dex"
    last_name "Kuo"
    email { generate :email }
    password "123456"
    password_confirmation "123456"
    phone "5555555555"
  end

  factory :admin_user , class: "AdminUser" do
    first_name "Admin"
    last_name "User"
    email { generate :email }
    password "123456"
    password_confirmation "123456"
    phone "5555555555"
  end

  factory :non_authorized_user, class: "User" do
    first_name 'Non'
    last_name 'Authorized'
    email { generate :email }
    password "asdfasdf"
    password_confirmation "asdfasdf"
    phone "5555555555"
  end

end

