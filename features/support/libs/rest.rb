#This Module defines Rest methods(GET,POST,PUT,DELETE)

module Rest
  def get(url, headers = nil)
    puts '  #################################################################################################### '
    puts "  URL - #{url} "
    puts "  HEADERS - #{headers}"
    puts '  #################################################################################################### '
    default_headers = {:content_type => :json, :accept => :json}
    default_headers.merge!(headers) if headers
    log_requested_url(url)
    @last_rest_method = "GET"
    url = url.force_encoding('ASCII-8BIT')
    @last_request = URI::encode(url)
    @last_response = RestClient.get(@last_request, default_headers) { |response| response }
    @last_response
  end

  def post(url, payload, headers = nil)
    puts '  #################################################################################################### '
    puts "  URL - #{url} "
    puts "  HEADERS - #{headers}"
    puts "  PAYLOAD - #{payload}"
    puts '  #################################################################################################### '
    default_headers = {:content_type => :json, :accept => :'text/plain'}
    default_headers.merge!(headers) if headers
    log_requested_url(url)
    @last_rest_method = "POST"
    url = url.force_encoding('ASCII-8BIT')
    @last_request = URI::encode(url)
    @last_response = RestClient.post(url, payload, default_headers) { |response| response }
    @last_response
  end

  def put(url, payload, headers = nil)
    puts '  #################################################################################################### '
    puts "  URL - #{url} "
    puts "  HEADERS - #{headers}"
    puts "  PAYLOAD - #{payload}"
    puts '  #################################################################################################### '
    @last_rest_method = "PUT"
    default_headers = {:content_type => :json, :accept => :json}
    default_headers.merge!(headers) if headers
    url = url.force_encoding('ASCII-8BIT')
    @last_request = URI::encode(url)
    @last_response = RestClient.put(url, payload, default_headers) { |response| response }
    @last_response
  end

  def delete(url, headers = nil)
    puts '  #################################################################################################### '
    puts "  URL - #{url} "
    puts "  HEADERS - #{headers}"
    puts "  PAYLOAD - #{payload}"
    puts '  #################################################################################################### '
    @last_rest_method = "DELETE"
    default_headers = {:content_type => :json, :accept => :json}
    default_headers.merge!(headers) if headers
    url = url.force_encoding('ASCII-8BIT')
    @last_request = URI::encode(url)
    @last_response = RestClient.delete(url, default_headers) { |response| response }
    @last_response
  end
end