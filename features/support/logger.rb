module LogGenerator
  File.exists?("logs")? "Logs folder exists" : Dir.mkdir("logs")

  @@logger = Logger.new("logs/#{Time.now.strftime("%Y%m%d-%H%M%S")}-#{ENV['environment']}-#{ENV['brand']}-#{ENV['country_name']}-#{ENV['country_code']}-#{ENV['language']}.log")

  log_level = ENV['LOG_LEVEL']
  if log_level == 'DEBUG'
    @@logger.level = Logger::DEBUG
  elsif log_level == 'WARN'
    @@logger.level = Logger::WARN
  elsif log_level == 'ERROR'
    @@logger.level = Logger::ERROR
  else
    @@logger.level = Logger::INFO
  end

  def logger
    @@logger
  end

end

World(LogGenerator)