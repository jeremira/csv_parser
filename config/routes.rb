Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :booking_data, only: [:new, :create, :show]

  root to: 'booking_data#show'
end
