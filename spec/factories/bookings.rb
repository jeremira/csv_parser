FactoryBot.define do
  factory :booking do
    sequence(:ticket_number) { |n| n }
    sequence(:booking_number) { |n| n }
    timestamp "2018-01-23 11:36:44"
    price 25
    product_type "abonnement"
    selling_point "guichet"
    venue
    spectator
  end
end
