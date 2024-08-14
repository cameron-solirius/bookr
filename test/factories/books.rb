FactoryBot.define do
    factory :book do
      sequence(:title) { |n| "Testing for Dummies #{n}" }
      author { "Tess Ter" }
      stars { 4.0 }
      finished { true }
      thoughts { "Now I'm a test wizz!" }
      finishedDate { Date.today }
      # f.association :user

      #traits for different scenarios
      trait :unfinished do
        finished { false }
        stars { nil }
        thoughts { nil }
        finishedDate { nil }
      end
  
      trait :five_star do
        stars { 5.0 }
      end
  
      trait :two_star do
        stars { 2.0 }
      end
    end

    # factory :user do |f|
    #   f.sequence(:name) { |n| "Test User #{n}" }
    #   f.sequence(:email) { |n| "test#{n}@example.com" }
    #   f.priority { 1 }
    #   f.association :user
    # end
  end
