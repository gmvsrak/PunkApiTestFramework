Before do |scenario|
  puts "#{scenario.name}}"
  logger.info("==========")
  logger.info("Start running scenario: #{scenario.name}")
  logger.info("#{Time.now.strftime("%Y%m%d-%H%M%S")}")
end

After do |scenario|
  if scenario.failed?
    puts "SCENARIO FAILED"
  end
  logger.info("Finished running scenario: #{scenario.name}")
  logger.info("==========")
end