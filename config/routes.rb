Rails.application.routes.draw do

  resources :documents

  resources :authors

  resources :comments

  root 'welcome#index'

  get 'import', to: 'welcome#import'
  post 'upload', to: 'welcome#upload'

  namespace :api, defaults: { format: :json } do

    scope module: :v1 do
      resources :documents, :only => [:show, :index]
      resources :authors, :only => [:show, :index]
      resources :comments , :only => [:show, :index]
    end

  end

end
