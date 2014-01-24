Rails.application.routes.draw do
  root to: 'high_voltage/pages#show', :id => 'demo'

  mount LiveLogs::Engine => "/live_logs"
end
