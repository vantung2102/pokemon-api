Rails.application.routes.draw do
  root 'supports#home'

  namespace :api do
    namespace :v1 do
      resources :blobs,
                param: :signed_id,
                only: %i[create show]

      namespace :auth do
        get :failure, to:'omniauth#failure'
        get ':provider/callback', to:'omniauth#create'
      end

      namespace :users do
        post :signup, to: 'registrations#create'
        post :verify, to: 'registrations#verify'

        post :login, to: 'sessions#create'

        get 'token/refresh', to: 'tokens#refresh'

        get :me, to: 'profiles#me'
        resources :profiles, only: %i[show]
        put :profiles, to: 'profiles#update'
        patch :profiles, to: 'profiles#update'
        delete :profiles, to: 'profiles#destroy'

        post :forgot_password, to: 'passwords#forgot_password'
        post :reset_password, to: 'passwords#reset_password'
      end

      namespace :pokedex do
        resources :pokemons, only: %i[index show update destroy]
      end
    end
  end
end
