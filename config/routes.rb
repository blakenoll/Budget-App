Rails.application.routes.draw do

  get '/', to: 'public#index'

  get 'public/index'

  get 'login', :to => 'access#login'

  get 'access/login'

  get 'access/attempt_login'
  post 'access/attempt_login'

  get 'access/logout'

  get 'addmoney', to: 'envelopes#edit_multiple'

  resources :envelopes do
    collection do
      get :edit_multiple
      put :update_multiple
    end
  end
  resources :users
  resources :transactions
  resources :add_money

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
