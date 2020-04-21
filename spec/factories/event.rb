FactoryBot.define do
  factory :event do
    association :user
    # Создаём случайное название
    title { "Очередная тусовка #{rand(999)}" }
    # Создаём случайный адрес
    address { "Улица строителей_#{rand(999)} дом_#{rand(999)}" }
  end
end
