Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles do
    resources :comments
  end
  # 这里的 "#" 表示： 对根路径的请求请求发往welcome控制器的index动作。
  root 'welcome#index'

end
