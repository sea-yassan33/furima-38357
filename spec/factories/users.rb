FactoryBot.define do
  factory :user do
    nickname              {'test_' + Faker::Name.initials(number: 4)}
    email                 {Faker::Internet.free_email}
    password              {'t1' + Faker::Internet.password(min_length: 5) }
    password_confirmation {password}
    last_name             {'てすと'}
    first_name            {'太郎'}
    last_name_kana        {'テスト'}
    first_name_kana       {'タロウ'}
    birth_date            {'1950-04-01'}
  end
end