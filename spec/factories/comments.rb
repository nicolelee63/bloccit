FactoryGirl.define do
  factory :comment do
    body RandomData.random_paragraph
    post
    user
    rank 0.0
  end
end
