Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do

        get 'players/', to: "players#index"
        get 'players/:id', to: "players#show"
        get 'players/:id/assessments/', to: "players#player_assessments"

        get 'tournaments/', to: "tournaments#index"
        get 'tournaments/:id', to: "tournaments#show"
        get 'tournaments/:id/events', to: "tournaments#tournament_events"
        get 'tournaments/:id/teams', to: "tournaments#tournament_teams"   

        get 'teams/', to: "teams#index"
        get 'teams/:id', to: "teams#show"

        get 'assessments/', to: "assessments#index"
        get 'assessments/:id', to: "assessments#show"
        patch 'assessments/:id', to: "assessments#update"
        delete 'assessments/:id', to: "assessments#destroy"
        post 'assessments/:id', to: "assessments#create"

        get 'notes/', to: "notes#index"
        get 'notes/:id', to: "notes#show"
        post 'notes/:id', to: "notes#create"
        patch 'notes/:id', to: "notes#update"
        delete 'notes/:id', to: "notes#destroy"

      # resources :users, only: :create do
      #     collection do
      #       post 'confirm'
      #       post 'login'
      #     end
      # end

        get 'users/', to: "users#index"
        get 'users/:id', to: "users#show"

        # resources :players
        #   get '/', to: "players#index"
        #   get '/:id', to: "players#show"
        #   get '/:id/assessments/', to: "players#player_assessments"
        # end

        # resources :tournaments
        #   get '/', to: "tournaments#index"
        #   get '/:id', to: "tournaments#show"
        # end

        # resources :teams
        #   get '/', to: "teams#index"
        #   get '/:id', to: "teams#show"
        # end

        # resources :assessments
        #   get '/', to: "assessments#index"
        #   get '/:id', to: "assessments#show"
        #   patch '/:id', to: "assessments#update"
        #   delete '/:id', to: "assessments#destroy"
        #   post '/:id', to: "assessments#create"
        # end

        # resources :notes
        #   get '/', to: "notes#index"
        #   get '/:id', to: "notes#show"
        #   post '/:id', to: "notes#create"
        #   patch '/:id', to: "notes#update"
        #   delete '/:id', to: "notes#destroy"
        # end
        
        # resources :users, only: :create do
        #     collection do
        #       post 'confirm'
        #       post 'login'
        #     end
        # end

        # resources :users
        #   get '/', to: "users#index"
        #   get '/:id', to: "users#show"
        # end





        # get 'players/', to: "players#index"
        # get 'players/:id', to: "players#show"

        # get 'tournaments/', to: "tournaments#index"
        # get 'tournaments/:id', to: "tournaments#show"

        # get 'teams/', to: "teams#index"
        # get 'teams/:id', to: "teams#show"        

        # get 'assessments/', to: "assessments#index"
        # get 'assessments/:id', to: "assessments#show"

        # get 'notes/', to: "notes#index"
        # get 'notes/:id', to: "notes#show"

        # get 'users/', to: "users#index"
        # get 'users/:id', to: "users#show"

      # GET /photos index display a list of all photos
      # GET /photos/new new return an HTML form for creating a new photo
      # POST  /photos create  create a new photo
      # GET /photos/:id show  display a specific photo
      # GET /photos/:id/edit  edit  return an HTML form for editing a photo
      # PUT /photos/:id update  update a specific photo
      # DELETE  /photos/:id destroy delete a specific photo
    end
  end
end
