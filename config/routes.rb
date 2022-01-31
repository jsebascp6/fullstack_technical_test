Rails.application.routes.draw do
  root to: "home#index"

  namespace :count_words do
    resource :by_file, only: [:create]
    resource :by_text, only: [:create]
    resource :result,  only: [:show]
  end
end
