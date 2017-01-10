Rails.application.routes.draw do

  root controller: :boards, action: :index

  resources :boards do
    resources :cards
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
