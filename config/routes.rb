Rails.application.routes.draw do
  root 'quiz_events#new'

  resources :quiz_events, only: [:new, :index, :create] do
    member do
      get :proceed
      patch :proceed
    end
  end
end
