Yeartogo::Application.routes.draw do
	scope "static" do
		get "home" => "static#home"
		get "about" => "static#about"
		get "terms" => "static#terms"
		get "privacy" => "static#privacy"
	end

	root :to => "static#home"
end
