Rails.application.routes.draw do
  devise_for :users

  authenticate :user do
    root 'welcome#home', as: :root
    get '/houses/:id/detail', to: 'houses#detail', as: 'house_detail'
    get '/people/:id/detail', to: 'people#detail', as: 'person_detail'
    get '/people/occupant/:house_id', to: 'people#new_occupant', as: 'new_occupant'
    get '/people/non_occupants', to: 'people#non_occupants', as: 'non_occupants'
    resources :addresses, :phones, :emails, :people,
              :person_phones, :person_addresses,
              :houses, :ownerships, :contributions,
              :positions
  end

  unauthenticated do
    devise_scope :user do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end
end
