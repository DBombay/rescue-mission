Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "questions#index"
  resources :questions, only: [:index, :show, :new, :create] do
    resource :answers, only: [:index, :new, :create]
  end
end
