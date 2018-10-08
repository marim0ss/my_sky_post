Rails.application.routes.draw do

  root to: 'users#index'

  resources :users
    # => index, show, new, create, edit, update, destroyのアクションに対応させることができる


  # resources :users do
  #     resources :posts    #ネストしてuserモデルにpostモデルを紐付ける
  #   end
end
