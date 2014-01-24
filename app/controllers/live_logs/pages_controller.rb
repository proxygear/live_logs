module LiveLogs
  class PagesController < ApplicationController
    include ::HighVoltage::StaticPage
    layout '/live_logs/application'
  end
end