FactoryGirl.define do
  factory :post do
    date Date.today
    rationable "Some rationable"
    overtime_request 3.5
    user
  end

  factory :secont_post ,class: "Post" do
    date Date.yesterday
    rationable "Some more content"
    overtime_request 0.5
    user
  end

end