Yeartogo::Application.routes.draw do
	# Logged in
	constraints lambda { |req| !req.session[:user_id].blank? } do
		get "profile" => "users#show", :as => "current_profile"
		get "profile/edit" => "users#edit", :as => "edit_profile"
		get "/:username/friend" => "friendships#create", :as => "friend"
		get "/:username/unfriend" => "friendships#destroy", :as => "unfriend"
		get "/friends/pending" => "friendships#pending", :as => "pending"
		get "/friends/approve/:username" => "friendships#approve", :as => "approve"
		get "/goals/:id/complete" => "goals#complete", :as => "complete"
		root :to => "users#show"
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
	get "/:username" => "users#show", :as => "profile"
	root :to => "static#home"
	
	# REST for iPhone
	resources :users
	resources :goals
	resources :comments
end
