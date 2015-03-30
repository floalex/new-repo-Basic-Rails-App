require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    name "Douglas Adams"
    sequence(:email, 100) { |n| "person#{n}@example.com}" }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now

    factory :user_with_post_and_comment do
      after(:build) do |user|
        post = create(:post, user: user)
        create(:comment, user: user, post: post)
      end
    end
  end
end

#This factory will generate a unique email for each user and mark them as confirmed_at, bypassing Devise's confirmation. You can use it in your specs:

#build(:user) # Initialize but do not save
#create(:user) # Build and save to test database
#create(:user, name: 'Other Name') # Try it

