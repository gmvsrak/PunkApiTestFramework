require_relative '../libs/common_methods_helper'
require_relative '../libs/rest'
require_relative '../libs/data_helper'
require 'date'

class PunkApiRequestClient < PunkApiRequestBuilder

#including common moduels using composition OOPs concept
  include CommonMethods
  include Rest
  include DataHelper

  @@beersendpoint = "get_beers"
  @@single_beer_endpoint = "get_single_beer"
  @@punk_api_base_url = "punk_api_endpoint"
  @@random_beer_endpoint = "get_random_beer"

  def get_all_beers
    path = get_path(@@beersendpoint)
    url = get_url(@@punk_api_base_url)
    request_url = "#{url}" + "#{path}"
    response = get(request_url)
    response
  end

  def get_beers_with_invalid_endpoint
    url = get_url(@@punk_api_base_url)
    request_url = "#{url}" + "/ksjdh"
    response = get(request_url)
    response
  end

  def get_beers_with_empty_parameter(param = "?food=")
    path = get_path(@@beersendpoint)
    url = get_url(@@punk_api_base_url)
    request_url = "#{url}" + "#{path}"  + "#{param}"
    responce = get(request_url)
    responce
  end

  def get_beers_with_invalid_parameter(param = "food")
    random = ('a'..'z').to_a.shuffle[0,8].join
    path = get_path(@@beersendpoint)
    url = get_url(@@punk_api_base_url)
    request_url = "#{url}" + "#{path}"  + "?#{param}=#{random}"
    responce = get(request_url)
    responce
  end

  def get_single_beer
    path = get_path(@@single_beer_endpoint)
    url = get_url(@@punk_api_base_url)
    request_url = "#{url}" + "#{path}"
    responce = get(request_url)
    responce
  end

  def get_random_beer
    path = get_path(@@random_beer_endpoint)
    url = get_url(@@punk_api_base_url)
    request_url = "#{url}" + "#{path}"
    responce = get(request_url)
  end

  def get_beer_with_params(params = nil)
    param_path = build_path_with_params(params)
    path = get_path(@@beersendpoint)
    url = get_url(@@punk_api_base_url)
    request_url = "#{url}" + "#{path}"  + "?#{param_path}"
    responce = get(request_url)
    responce
  end

  def get_expected_data(params = nil)
    expected_data = build_data_with_params(params)
    expected_data
  end

  def get_data_from_response(responce, params)
    if responce.class == Array
      (responce.size > 1) ? @resp = responce.sample : @resp = responce.first
    end
    data = []
    if params.size > 1
      params.each do |param|
        data << get_single_data_from_responce(@resp,param)
      end
      data
    else
      return get_single_data_from_responce(@resp,params.first)
    end
  end

end