FactoryGirl.define do
  factory :unit do
    name "Celsius"
    short_name  "C"
  end

  # This will use the User class (Admin would have been guessed)
  factory :fahrenheit, class: Unit do
    name "Fahrenheit"
    short_name  "F"
  end

  factory :celsius_definition, class: Definition do
    formula    'C * 9 / 5 +32'
    association :unit, factory: :unit
    association :converted_to, factory: :fahrenheit
  end

  factory :fahrenheit_definition, class: Definition do
    formula    '(F - 32) * 5/9'
    association :unit, factory: :fahrenheit
    association :converted_to, factory: :unit
  end

end