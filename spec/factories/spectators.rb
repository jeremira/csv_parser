FactoryBot.define do
  factory :spectator do
    firstname "Jean-Louis"
    lastname "De la Roche-crayon"
    sequence(:email) { |n| "spectator#{n}@factorybot.com" }
    adress "10 rue du chat vert"
    zip_code 31010
    country "France"
    age 54
    sexe 'M'
  end
end
