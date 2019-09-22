#To Create request URL's for given request

class PunkApiRequestBuilder

  def build_path_with_params(params)
    path = []
    @expected_data_array = []
    if params.size > 1
      params.each do |param|
        path << build_path_with_single_param(param)
        @expected_data_array << @expected_data
      end
      request_path = "#{path.join("&")}"
      request_path
    else
      return build_path_with_single_param(params.first)
    end
  end

  def build_data_with_params(params)
    if params.size > 1
      @expected_data_array
    else
      @expected_data
    end
  end

  def build_path_with_single_param(param)
    @expected_data = build_test_data(param)
    request_path = "#{PATH_FILE['params'][param]}=#{@expected_data}"
    request_path
  end

  def build_test_data(param)
    case param.downcase
      when 'beer_name'
        return TEST_DATA[:beer]['name'].split(' ').join('_')
      when 'hops_name'
        TEST_DATA[:beer]['ingredients']['hops'].sample['name'].split(' ').join('_')
      when 'yeast_name'
        TEST_DATA[:beer]['ingredients']['yeast'].split(' ').join('_')
      when 'before_date'
        TEST_DATA[:beer]['first_brewed'].split('/').join('-')
      when 'after_date'
        TEST_DATA[:beer]['first_brewed'].split('/').join('-')
      when 'food_name'
        TEST_DATA[:beer]['food_pairing'].sample.split(' ').join('_')
      when 'malt_name'
        TEST_DATA[:beer]['ingredients']['malt'].sample['name'].split(' ').join('_')
      when 'matching_id'
        TEST_DATA[:beer]['id'].to_s
      when 'current_date'
        "#{Date.today.strftime("%m")}-#{Date.today.strftime("%Y")}"
      else
        raise StandardError, "Please provide valid parameters"
    end
  end

  def get_single_data_from_responce(resp,param)
    case param.downcase
      when ('beer_name')
        resp['name']
      when ('hops_name')
        resp['ingredients']['hops'].map{ |n| n['name']}
      when ('yeast_name')
        resp['ingredients']['yeast']
      when ('before_date')
        resp['first_brewed']
      when ('after_date')
        resp['first_brewed'].split('/').join('-')
      when ('food_name')
        resp['food_pairing'].map{ |n| n}
      when ('malt_name')
        resp['ingredients']['malt'].map{ |n| n['name']}
      when ('matching_id')
        resp['id'].to_s
      else
        raise StandardError, "Please provide valid parameters"
    end
  end

  def get_dates_from_response(resp,param)
    dates = resp.map{|res| DateTime.parse("#{res['first_brewed'].split('/').reverse.join('')}1", "%Y%m%d")}
    dates
  end

end