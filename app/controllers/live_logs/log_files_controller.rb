module LiveLogs
  class LogFilesController < ApplicationController
    expose(:log_files) { LiveLogs::LogFile.all }
  
    def index
      names = log_files.collect {|f| f.name }
      render json: {names: names}
    end
  end
end