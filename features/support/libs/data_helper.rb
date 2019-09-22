module DataHelper

  def validate_responce(actual_data, expected_data)
    if actual_data.class != Array
      expect(actual_data.downcase.eql? expected_data.downcase).to be_truthy, "#{actual_data} in responce did not match with  #{expected_data}"
    elsif actual_data.class == Array && expected_data.class != Array
      expect(actual_data.map(&:downcase).include?expected_data.downcase).to be_truthy, "#{actual_data} in responce did not match with  #{expected_data}"
    elsif actual_data.size == expected_data.size
      expect(actual_data.sort == expected_data.sort).to be_truthy, "#{actual_data} in responce did not match with  #{expected_data}"
    else
      expect((actual_data & expected_data).empty?).to be_falsey, "#{actual_data} in responce did not match with  #{expected_data}"
    end
    logger.info("#{actual_data} is in match with #{expected_data}")
    puts("#{actual_data} is in match with #{expected_data}")
  end

  def get_url(key)
    url = CONFIG_FILE["#{key}"]
    logger.info("URL Path is #{url}")
    url
  end

  def get_path(key)
    path = PATH_FILE["#{key}"]
    logger.info("Path is #{path}")
    path
  end

  def add_punk_api_test_data(response)
    if response.class == Array
      api_data = {"beer".to_sym => response.first}
    else
      api_data = {"beer".to_sym => response}
    end
    store_test_data(api_data)
  end

  def store_test_data(response)
    File.open("config/punk_api_testdata.yaml", 'w') { |file| file.write(response.to_yaml) }
  end

end

World(DataHelper)