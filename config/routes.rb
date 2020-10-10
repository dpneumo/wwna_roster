Rails.application.routes.draw do
  resources :occupants
  resources :houses
  resources :lots
  resources :people
  resources :person_addresses
  resources :person_emails
  get 'welcome/index'

  resources :addresses, :phones, :emails, :persons,
            :person_phones,
  					:lots, :houses, :occupants, :owners

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
