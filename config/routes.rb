Rails.application.routes.draw do
  get 'welcome/index'
  get '/houses/:id/detail', to: 'houses#detail', as: 'house_detail'
  get '/people/:id/detail', to: 'people#detail', as: 'person_detail'

  resources :addresses, :phones, :emails, :people,
            :person_phones, :person_addresses,
  					:houses, :occupants, :ownerships, :contributions,
            :registrations

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
