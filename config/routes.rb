Rails.application.routes.draw do
  resources :form_responses, only: :index
end