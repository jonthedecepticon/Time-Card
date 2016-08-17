FactoryGirl.define do
  factory :post do
    date Date.today
    rational "Some rationale..."
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rational "Some old rationale..."
    user
  end
end
