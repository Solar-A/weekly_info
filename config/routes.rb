# frozen_string_literal: true

Rails.application.routes.draw do
  constraints(Subdomains::App) do
    namespace :admin do
      resources :weekly_infos, except: %i[destroy show]
    end
  end
end
