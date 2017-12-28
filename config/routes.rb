Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'twilio/reply' => 'twilio#reply'

  namespace :api do
    namespace :v1 do
      resources :users
      # post 'users/reply' => 'users#reply'
    end
  end
  # resource :twilio do
  #   collection do
  #     post 'reply'
  #   end
  # end
end
