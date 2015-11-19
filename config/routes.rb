Rails.application.routes.draw do
  root to: 'puzzles#index'
  resources :puzzles
end
