Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'twilio/reply' => 'twilio#reply'

  # resource :twilio do
  #   collection do
  #     post 'reply'
  #   end
  # end
end
