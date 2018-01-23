FactoryBot.define do
  factory :booking do
    ticket_number 1
    booking_number 1
    timestamp "2018-01-23 11:36:44"
    price 1
    product_type "MyString"
    selling_point "MyString"
    venue nil
  end
end
