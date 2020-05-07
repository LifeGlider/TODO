FactoryBot.define do 
  factory :task do
    done { Faker::Boolean.boolean }
    todo { Faker::Name.name }
    important { Faker::Boolean.boolean }
  end
end
