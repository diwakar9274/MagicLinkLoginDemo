Rails.application.routes.draw do
  passwordless_for :users, at: '/', as: :auth
  root "posts#index"
end
