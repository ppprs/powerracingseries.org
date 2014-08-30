PowerracingseriesOrg::Application.routes.draw do
  
  get "admin/index"

#  get "home/index"

#  get "home/show"

  get "home"            => "home#index"

  # Auth and user editing
  devise_for :people, :path => "account"

  get   "rules"         => "rules#index"

  # R-R-Registration
  get   "register"      => "register#new"
  post  "register"      => "register#create"
  put   "register"      => "register#create"

  # Videos
  get "videos"          =>"videos#index"


  # Public team viewing
  #get   "teams"             => "teams#index"
  #get   "teams/:team_name"  => "teams#show"

  match "teams"         => "teams#index"
  match "teams/past"    => "teams#past"
  match "teams/:slug"   => "teams#show", :as => :team

  # User team viewing/editing
  get   "my_team"       => "teams#show"
  get   "my_team/edit"  => "teams#edit"
  put   "my_team"       => "teams#update"
  get   "my_team/visibility_request"  => "teams#visibility_request", :as => :make_visible

  scope "/my_team" do
    resources :people
    resources :cars
  end

  get "admin"           => "admin#index"

  scope "/admin" do
    resources :teams
    resources :people
    resources :cars
  end
#  namespace 

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  
  # WOO PARTY TIME REDIRECTS

  get '/sign-up', to: redirect('/register')
  get '/data/pppwrs-packet.pdf', to: redirect('/rules')

  #/blog/* -> ???

  # MISSING PAGES
  #/links
  #/media
  #/contact

end
