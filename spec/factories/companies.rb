FactoryBot.define do
  factory :company do
    name { 'My new Company' }
    location { 'Remote Location' }
    user { create(:user) }
  end
end