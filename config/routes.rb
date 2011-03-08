Yeartogo::Application.routes.draw do
  get "users/show"

  get "users/new"

  get "users/create"

  get "users/destroy"

  get "users/edit"

  get "users/update"

  get "users/activate"

	scope "static" do
		get "home" => "static#home"
		get "about" => "static#about"
		get "terms" => "static#terms"
		get "privacy" => "static#privacy"
	end

	root :to => "static#home"
end
