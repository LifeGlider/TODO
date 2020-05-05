FactoryBot.define do 
  factory :task do
    done { false }
    todo { 'This is a test' }
    important { false }
  end
end
