require_relative '../../support/logger'

#Module for common methods
module CommonMethods

  include LogGenerator

  def convert_responce_to_hash(response)
    logger.info("I FOUND THE RESPONSE CODE TO BE #{response.code}")
    raise StandardError, "ERROR Response code :#{response.code} Response: #{response.to_s.force_encoding('iso-8859-1').encode('utf-8')}" if response.code != 200
    logger.info("Response code : #{response.code}")
    parsed_json_response = parse_response(response)
    parsed_json_response
  end

  def log_response(response)
    logger.info("Response: #{response.to_s.force_encoding('iso-8859-1').encode('utf-8')}")
  end

  def log_requested_url(request_url)
    logger.info("Requested URL is : #{request_url}")
  end

  def parse_response(response)
    parsed_json = JSON.parse(response)
    parsed_json
  end

end