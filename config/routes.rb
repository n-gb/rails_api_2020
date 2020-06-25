# frozen_string_literal: true

Rails.application.routes.draw do
  resources :usernames, only: :index
end
