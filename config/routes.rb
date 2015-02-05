Rails.application.routes.draw do

  mount RademadeAdmin::Engine => '/admin'
  namespace :rademade_admin, path: '/admin' do

    admin_resources :users

  end

  scope :api, module: :api, defaults: {format: :json} do
    resources :users, :only => [:index]
  end

  scope :module => :public do
    root 'index#index'
    get '*path', :to => 'index#index'
  end

end