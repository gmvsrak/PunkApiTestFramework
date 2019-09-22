#importing the libraries required
require 'yaml'
require 'rspec'
require 'json'
require 'date'
require 'active_support'
require 'net/http'
require 'rest_client'
require 'require_all'
require 'open-uri'
require 'nokogiri'
require 'awesome_print'
require 'geocoder'
require 'awesome_print'
require 'pry'
require_rel '../support/api_data_modules'
require_relative '../../features/support/logger'

#Loading configuration files

puts "Loading config files"

puts File.dirname(__FILE__)

def load_file(file)
  YAML.load_file(File.open( File.dirname(__FILE__) + "#{file}" ))
end

OUTPUT = @__cucumber_runtime

CONFIG_FILE = load_file("/../../config/punk_api_config.yaml")
PATH_FILE = load_file("/../../config/punk_api_paths.yaml")
TEST_DATA = load_file("/../../config/punk_api_testdata.yaml")

#creating results folder
File.exists?("results/punk_api")? "results/punk_api folder exists" : FileUtils::mkdir_p("results/punk_api")
