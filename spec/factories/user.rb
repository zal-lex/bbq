FactoryBot.define do
  factory :user do
    # Создаём случайное имя
    name { "User_#{rand(999)}" }
    # Создаём уникальный e-mail
    sequence(:email) { |n| "someguy_#{n}@example.com" }
    # Коллбэк — после фазы :build записываем поля паролей, иначе Devise не
    # позволит создать юзера
    after(:build) { |u| u.password_confirmation = u.password = '123456' }
  end
end
