
FactoryGirl.define do
  factory :instructor, :class => Refinery::Instructors::Instructor do
    sequence(:full_name) { |n| "refinery#{n}" }
  end
end

