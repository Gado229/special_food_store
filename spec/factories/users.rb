FactoryBot.define do
  factory :user do
    id { 2 }
    name { 'Gado229' }
    email { 'imoroug@gmail.com' }
    password { 'azerty' }
    admin { false }
  end

  factory :user1 do
    id { 4 }
    name { 'Invité(e)' }
    email { 'spfoodinvite@gmail.com' }
    password { 'azerty' }
    admin { false }
  end

  factory :admin_user, class: User do
    id { 1 }
    name { 'Admin' }
    email { 'monadministrateur@gmail.com' }
    password { 'azerty' }
    admin { true }
  end
end
