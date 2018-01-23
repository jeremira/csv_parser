FactoryBot.define do
  factory :spectacle do
    sequence(:key) { |n| n }
    name "spectacle name test"
  end
end
