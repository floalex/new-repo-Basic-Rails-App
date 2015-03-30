require 'factory_girl_rails'

FactoryGirl.define do
  factory :post do
    title "Post Title"
    body "Post bodies must be prerry long."
    user
    topic { Topic.create(name: 'Topic name') }
  end
end