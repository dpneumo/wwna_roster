Rails.application.routes.draw do
  resources :person_addresses
  resources :person_emails
  get 'welcome/index'

  resources :addresses, :phones, :emails, :persons,
            :person_phones,
  					:lots, :houses, :occupents, :owners

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
