Rails.application.routes.draw do

  root 'welcome#index'

  get 'new/comment', to: 'welcome#new_comment'

  namespace :api, defaults: { format: :json } do

    scope module: :v1 do
      resources :documents, :only => [:show, :index]
      resources :authors, :only => [:show, :index]
      resources :comments , :only => [:show, :index]
    end

  end

end
