Rails.application.routes.draw do
  get 'welcome/index'
  get '/houses/:id/detail', to: 'houses#detail', as: 'house_detail'
  get '/people/:id/detail', to: 'people#detail', as: 'person_detail'
  get '/people/occupant/:house_id', to: 'people#new_occupant', as: 'new_occupant'
  get '/people/non_occupants', to: 'people#non_occupants', as: 'non_occupants'

  get '/reports/homes', to: 'reports#homes', as: 'homes'

  resources :addresses, :phones, :emails, :people,
            :person_phones, :person_addresses,
  					:houses, :ownerships, :contributions,
            :registrations

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
