Fabricator :user_account  do
  login_name { Fabricate.sequence(:login_name){|i| "login#{i}" }}
  password { '123456' }
  password_confirmation { '123456' }
end
