# frozen_string_literal: true

Rails.application.routes.draw do
  resources :form_responses, only: :index
end
