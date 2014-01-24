module LiveLogs
  class LogTail < ::File
    include ::File::Tail
  end
end