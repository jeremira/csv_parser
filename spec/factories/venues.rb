FactoryBot.define do
  factory :venue do
    sequence(:key) { |n| n }
    start_time "2018-01-23 11:00:00"
    end_time "2018-01-24 14:00:00"
    spectacle
  end
end
