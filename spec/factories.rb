FactoryGirl.define do 
  factory :user do
    sequence(:name) 	{ |n| "Person #{n}" }
    sequence(:email)	{ |n| "person_#{n}@example.com" }
    password "testtest"
    password_confirmation "testtest"

    factory :admin do
    	admin true
    end
  end
end
