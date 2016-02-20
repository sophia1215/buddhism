Rails.application.routes.draw do

  devise_for :members, :controllers => {
    :registrations => "members/registrations",
    :sessions => "members/sessions",
    :passwords => "members/passwords",
    :confirmations => "members/confirmations"
  }

  devise_scope :member do
    get 'sign_up', to: "members/registrations#new"
    get 'sign_in', to: "members/sessions#new"
    delete 'sign_out', to: "members/sessions#destroy"
  end

	resources :home
	resources :members

  root 'home#index'

end