LiveLogs::Engine.routes.draw do
  root to: 'pages#show', id: 'live_logs/app'

  resources :log_files
  get 'logs/*file_name' => 'logs#show'
end
