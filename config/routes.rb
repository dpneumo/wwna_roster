# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  authenticate :user do
    get   '/users',           to: 'users/admin#index',  as: 'users'
    get   '/users/:id',       to: 'users/admin#show',   as: 'show_user'
    get   '/users/:id/edit',  to: 'users/admin#edit',   as: 'edit_user'
    patch '/users/:id',       to: 'users/admin#update', as: 'user'

    get   '/houses/:id/detail', to: 'houses#detail', as: 'house_detail'
    get   '/people/:id/detail', to: 'people#detail', as: 'person_detail'
    get   '/people/occupant/:house_id', to: 'people#new_occupant', as: 'new_occupant'
    get   '/non_occupants', to: 'non_occupants#index', as: 'non_occupants'
    patch '/non_occupant/:id', to: 'non_occupants#update', as: 'non_occupant'
    resources :addresses, :phones, :emails, :people,
              :person_phones, :person_addresses,
              :houses, :ownerships, :contributions,
              :positions
    root 'welcome#home', as: :root
  end

  unauthenticated do
    devise_scope :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
