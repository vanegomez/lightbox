Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/instagram', as: :login
end
