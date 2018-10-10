Rails.application.routes.draw do

  devise_for :users
  root to: 'posts#index'

  resources :users
    # => index, show, new, create, edit, update, destroyのアクションに対応させることができる

  resources :posts

  # resources :users do
  #     resources :posts    #ネストしてuserモデルにpostモデルを紐付ける
  #   end
end
