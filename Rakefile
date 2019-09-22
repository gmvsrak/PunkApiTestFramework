require 'rake'
require 'yaml'

task :regression do
  puts '================================================='
  puts '          starting parallel Full Regression run'
  puts '================================================='

  FileUtils.mkdir("results") unless Dir.exists?("results")
  FileUtils.mkdir("results/punk_api") unless Dir.exists?("results/punk_api")
  FileUtils.rm_rf Dir["results/punk_api/parallel"]
  FileUtils.rm Dir["results/punk_api/*.log" , "results/punk_api/r*.html","results/punk_api/r*.json"]
  time_stamp = Time.new.strftime "%d%m%Y%H%M"
  system "bundle exec parallel_test --type cucumber features/ -n 4 -o '-p  regression_profile' --group-by scenarios"
  system "report_builder -s 'results/punk_api' -o 'results/punk_api_regression_report' -T punk_api_feature_report -t overview,features,scenarios,errors"
end


task :smoke do
  puts '================================================='
  puts '          starting parallel Full Regression run'
  puts '================================================='

  FileUtils.mkdir("results") unless Dir.exists?("results")
  FileUtils.mkdir("results/punk_api") unless Dir.exists?("results/punk_api")
  FileUtils.rm_rf Dir["results/punk_api/parallel"]
  FileUtils.rm Dir["results/punk_api/*.log" , "results/punk_api/r*.html","results/punk_api/r*.json"]
  time_stamp = Time.new.strftime "%d%m%Y%H%M"
  system "bundle exec parallel_test --type cucumber features/ -n 4 -o '-p  smoke_profile' --group-by scenarios"
  system "report_builder -s 'results/punk_api' -o 'results/punk_api_smoke_report' -T punk_api_feature_report -t overview,features,scenarios,errors"
end

