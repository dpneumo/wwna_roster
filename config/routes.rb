Rails.application.routes.draw do
  get 'welcome/index'

  resources :addresses, :lots, :phones, :emails, :people,
            :person_phones, :person_emails, :person_addresses,
  					:houses, :occupancies, :ownerships, :contributions

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
