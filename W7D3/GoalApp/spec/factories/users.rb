FactoryBot.define do 
  factory :user do
    username { 'Capy' }
    password { 'password' }
    session_token { 'session_token' }
  end
end