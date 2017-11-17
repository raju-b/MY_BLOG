Rails.application.routes.draw do
	
      devise_for :users, controllers: {
        sessions: 'users/sessions',
        omniauth_callbacks: "users/omniauth_callbacks"
      }
  
	#devise_for :users,:controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  root to: "posts#index"
    
   resources :posts do
    member do
      post :like
      post :dislike
    end
	   resources :comments
  end 
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
