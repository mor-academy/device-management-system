Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root "static_pages#index"

    devise_for :users, skip: :omniauth_callbacks
    resources :user_subscriptions
    resources :companies do
      resources :offices do
        member do
          get :new_users

          patch :add_users
        end
      end
    end
    resources :user_devices
    resources :requests
    resources :devices do
      resources :device_histories

      member do
        get :new_sub_devices
        get :new_images_device

        patch :add_sub_devices
        patch :add_images_device
      end

      collection do
        get :import_page

        match :import, via: [:get, :post]
        
        patch :confirm_devices
      end
    end
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
