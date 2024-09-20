class LogLineParser
  attr_reader :message
  attr_reader :log_level
  attr_reader :reformat

  def initialize(line)
    lvl, msg = line.match(/^\[(.+)\]:(.+)/).captures
    @log_level = lvl.downcase
    @message = msg.strip
    @reformat = '%{message} (%{level})' % { :message => message, :level => log_level}
  end
end
