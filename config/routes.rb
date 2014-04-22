PigLatinizer::Application.routes.draw do
  root to: "words#new"

  resources :words, only: [:new, :create]
end
