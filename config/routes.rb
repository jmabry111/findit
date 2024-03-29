Findit::Application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'sign_in' => 'devise/sessions#new', :as => :sign_in
    post 'sign_in' => 'devise/sessions#create', :as => :sign_in
    delete 'sign_out' => 'devise/sessions#destroy', :as => :sign_out
    get 'register' => 'devise/registrations#new'
    post 'register' => 'devise/registrations#create'
  end
  resources :users, :except => [:new, :create]
  resources :allowed_users, :only => :create
  resources :comments
  resources :areas, :except =>[:show]
  resources :projects, :except => [:show]
  resources :tickets do
    collection do
      post 'take'
      get 'show_by_area'
      get 'show_by_project'
    end
  end
  resources :operating_systems, :except => [:show]
  resources :dns_names
  resources :softwares
  resources :locations, :except => [:show]
  resources :buildings, :except => [:show]
  resources :items do
    collection do
      get 'not_checked'
      post 'add_ip'
      get 'remove_ip'
      get 'remove_dns_name'
      get 'mark_as_inventoried'
      get 'surplus'
    end
  end
  resources :reports, :only=>:index do
    collection do
      get :dns
      get :proc_ratings
      get :upgrades
    end
  end
  resources :ips, :except => [:show]
  resources :pages
  resources :installations do
    collection do
      post 'install_software'
      get 'uninstall_software'
    end
  end
  resources :incoming_email, :only=>[:index]
  match "mail", :to=>"incoming_email#index", :as=>"mail"
  root :to=>"items#index", :type=>"Desktop"
end
