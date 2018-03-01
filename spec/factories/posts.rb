FactoryGirl.define do
  factory :post do
    date Date.today
    rationable "Some rationable"
    user
  end

  factory :secont_post ,class: "Post" do
    date Date.yesterday
    rationable "Some more content"
    user
  end

end