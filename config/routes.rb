Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
    root to: "public/homes#top"
  namespace :public do
    get 'homes/about'
  end
  
  namespace :public do
    resources :items, only: [:index, :show]
  end
  
  devise_for :customers,skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
  }
  
  namespace :public do
    resources :customers , only: [:show, :edit, :update] do
    collection do
      get 'unsubscribe'
      patch 'withdraw'
    end
   end
  end
  
  namespace :public do
    resources :cart_items , except: [:new, :show, :edit] do
    collection do
      delete 'destroy_all'
    end
   end
  end
  
  namespace :public do
    resources :orders, except: [:edit, :update, :destroy] do
     collection do
      post 'confirm'
      get 'complete'
     end
   end
  end
  
  namespace :public do
    resources :addresses, except: [:new, :show]
  end
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
   sessions: "admin/sessions"
  }
  
  namespace :admin do
    root to: "homes#top"
  end  
  
  namespace :admin do
    resources :items, except: [:destroy]
  end
  
  namespace :admin do
    resources :genres, except: [:new, :show, :destroy]
  end
  
  namespace :admin do
    resources :customers, except: [:new, :create, :destroy]
  end
  
  namespace :admin do
    resources :orders, only: [:show, :update]
  end
  
  namespace :admin do
    patch 'order_details'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
