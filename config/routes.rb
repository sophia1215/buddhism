Rails.application.routes.draw do

	resources :home
	resources :members

  root 'home#index'

end