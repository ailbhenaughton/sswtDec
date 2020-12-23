Rails.application.routes.draw do
  get 'cart/index'

  resources :items
  #get 'static_pages/home'
  root 'static_pages#home'
  #get 'static_pages/help'
  
  get '/help' => 'static_pages#help'
  get '/about' => 'static_pages#about'
  
  get '/login', to: 'user#login'
  get '/logout', to: 'user#logout'
  
  
  get '/clearcart', to: 'cart#clearCart'
  get '/cart', to: 'cart#index'
  get '/cart/:id', to: 'cart#add'
  get '/cart/remove/:id' => 'cart#remove'
  get '/cart/decrease/:id' => 'cart#decrease'
  
  #root :to => 'static_pages#home'
  root :to => 'site#home'
  
  get 'orderitems/index'

  get 'orderitems/show'

  get 'orderitems/new'

  get 'orderitems/edit'

  resources :orders do 
    resources:orderitems
  end
  
  devise_for :users do 
    resources :orders
  end
  
  get '/checkout' => 'cart#createOrder'
  get '/paid/:id' => 'static_pages#paid'
  #get 'static_pages/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
