class LogLineParser

  attr_reader :message,
              :log_level,
              :reformat

  def initialize(line)
    /^\[(?<level_capture>.+)\]:(?<message_capture>.+)/ =~ line
    @log_level = level_capture.downcase
    @message = message_capture.strip
    @reformat = "#{message} (#{log_level})"
  end

end
