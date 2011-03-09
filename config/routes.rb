Yeartogo::Application.routes.draw do
  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"

	# Logged in
	constraints lambda { |req| !req.session[:user_id].blank? } do
		root :to => "static#home"
	end
	
	# Static, not logged in
	scope "static" do
		get "home" => "static#home"
		get "about" => "static#about"
		get "terms" => "static#terms"
		get "privacy" => "static#privacy"
	end
	get "recover" => "users#recover", :as => "recovery"
	post "send_recovery" => "users#send_recovery", :as => "send_recovery"
	get "reset/:token" => "users#reset_form", :as => "reset_form"
	post "reset" => "users#reset_password", :as => "reset_password"
	get "activate/:token" => "users#activate", :as => "activate"
	get "logout" => "sessions#destroy", :as => "logout"
	get "login" => "sessions#new", :as => "login"
	post "login" => "sessions#create", :as => "sessions"
	get "register" => "users#new", :as => "register"
	root :to => "static#home"
	
	# REST for iPhone
	resources :users
end
