When(/^I send request to (.*?) V2$/) do |page_name|
  @current_page = get_page_object("#{page_name} request client")
end

When(/^I retrieve single beer$/) do
  @responce = @current_page.get_single_beer
end

When(/^I retrieve beers$/) do
  @responce = @current_page.get_all_beers
end

When(/^I retrieve random beer$/) do
  @responce = @current_page.get_random_beer
end

Then(/^I should get (.*?) responce$/) do |responce_code|
  puts("I FOUND THE RESPONSE CODE TO BE #{@responce.code}")
  logger.info("I FOUND THE RESPONSE CODE TO BE #{@responce.code}")
  expect(@responce.code.to_s == responce_code.to_s).to be_truthy, "Did not get #{responce_code} instead i got #{@responce.code}"
end

Then(/^I should get 1 beer$/) do
  @parse_data = @current_page.convert_responce_to_hash(@responce)
  expect(@parse_data.size <= 1).to be_truthy, "The Repose have more than one beer"
  puts(@parse_data.first['id'])
end

Then(/^I build dynamic data$/) do
  @parse_data = @current_page.convert_responce_to_hash(@responce)
  @current_page.add_punk_api_test_data(@parse_data)
end


And(/^I should have list of beers$/) do
  @parse_data = @current_page.convert_responce_to_hash(@responce)
  expect(@parse_data.size >= 25).to be_truthy, "The Repose dosent have more 25 beers"
  puts(@parse_data.first['id'])
end

And(/^I should get random beer data$/) do
  @parse_data = @current_page.convert_responce_to_hash(@responce)
  @first_beer_id = @parse_data.first['id']
end

And(/^I should get other random beer data$/) do
  @parse_data = @current_page.convert_responce_to_hash(@responce)
  @second_beer_id = @parse_data.first['id']
end

Then(/^I compare random beers retrieved beers should be different$/) do
  expect(@first_beer_id == @second_beer_id).to be_falsey, "Random beers are not retrived"
end

When(/^I retrieve beers with a given (.*?)$/) do |param|
  parameters = [param]
  @responce = @current_page.get_beer_with_params(parameters)
  @expected_data = @current_page.get_expected_data(parameters)
  puts " Searched for expected data - #{@expected_data} "
end

And(/^The retrieved beers should match with provided (.*?)$/) do |param|
  parameters = [param]
  @parse_data = @current_page.convert_responce_to_hash(@responce)
  @expected_data = @current_page.get_expected_data(parameters).split("_").join(" ")
  @actual_data = @current_page.get_data_from_response(@parse_data, parameters)
  validate_responce(@actual_data, @expected_data)
end

And(/^The retrieved beers should be brewed (.*?)$/) do |param|
  parameters = [param]
  @parse_data = @current_page.convert_responce_to_hash(@responce)
  if @parse_data.size > 0
    if param == 'current_date'
      @expected_date = DateTime.now
    else
      @expected_date = DateTime.parse("#{@expected_data.split('-').reverse.join('')}1", "%Y%m%d")
    end

    @actual_dates = @current_page.get_dates_from_response(@parse_data, parameters)
    if param == 'before_date' || param == 'current_date'
      @actual_dates.each do |date|
        expect(date < @expected_date).to be_truthy, "Beers are brewed after given before date"
      end
    elsif param == 'after_date'
      @actual_dates.each do |date|
        expect(date > @expected_date).to be_truthy, "Beers are brewed after given before date"
      end
    else
      fail("For given #{param} there is no data")
    end
    puts "#{@expected_date} is in match with #{@actual_dates}"
  end
end

When(/^I retrieve beers matching with 2 given (.*) and (.*) only$/) do |parm_1, parm_2|
  parameters = [parm_1,parm_2]
  @responce = @current_page.get_beer_with_params(parameters)
  @expected_data = @current_page.get_expected_data(parameters)
  puts " Searched for expected data - #{@expected_data} "
end

And(/^The retrieved beers should match with 2 given (.*) and (.*) only$/) do |parm_1, parm_2|
  parameters = [parm_1, parm_2]
  @parse_data = @current_page.convert_responce_to_hash(@responce)
  @expected_data = @current_page.get_expected_data(parameters).map{|data| data.split("_").join(" ")}
  @actual_data = @current_page.get_data_from_response(@parse_data, parameters).flatten
  validate_responce(@actual_data, @expected_data)
end

When(/^I retrieve beers matching with 3 given (.*) and (.*) and (.*) parameters/) do |parm_1, parm_2, parm_3|
  parameters = [parm_1,parm_2,parm_3]
  @responce = @current_page.get_beer_with_params(parameters)
  @expected_data = @current_page.get_expected_data(parameters)
  puts " Searched for expected data - #{@expected_data} "
end

When(/^The retrieved beers should match with 3 given (.*) and (.*) and (.*) parameters/) do |parm_1, parm_2, parm_3|
  parameters = [parm_1, parm_2, parm_3]
  @parse_data = @current_page.convert_responce_to_hash(@responce)
  @expected_data = @current_page.get_expected_data(parameters).map{|data| data.split("_").join(" ")}
  @actual_data = @current_page.get_data_from_response(@parse_data, parameters).flatten
  validate_responce(@actual_data, @expected_data)
end

And(/^I retrieve beers matching with 4 given (.*) and (.*) and (.*) and (.*) parameters only$/) do |parm_1, parm_2, parm_3, parm_4|
  parameters = [parm_1,parm_2,parm_3, parm_4]
  @responce = @current_page.get_beer_with_params(parameters)
  @expected_data = @current_page.get_expected_data(parameters)
  puts " Searched for expected data - #{@expected_data} "
end

And(/^The retrieved beers should match with 4 given (.*) and (.*) and (.*) and (.*) parameters only$/) do |parm_1, parm_2, parm_3, parm_4|
  parameters = [parm_1, parm_2, parm_3, parm_4]
  @parse_data = @current_page.convert_responce_to_hash(@responce)
  @expected_data = @current_page.get_expected_data(parameters).map{|data| data.split("_").join(" ")}
  @actual_data = @current_page.get_data_from_response(@parse_data, parameters).flatten
  validate_responce(@actual_data, @expected_data)
end

When(/^I retrieve beers with a empty food parameters$/) do
  @responce = @current_page.get_beers_with_empty_parameter
end

When(/^I retrieve beers with a invalid (.*?) parameter$/) do |parm|
  @responce = @current_page.get_beers_with_invalid_parameter(parm)
end

When(/^I retrieve beers with a invalid endpoint$/) do
  @responce = @current_page.get_beers_with_invalid_endpoint
end

And(/^The responce should be empty$/) do
  @parse_data = @current_page.convert_responce_to_hash(@responce)
  expect(@parse_data.size > 0).to be_falsey, "Able to retrive data with invalid parameters"
  puts("I FOUND THE RESPONSE DATA TO BE #{@parse_data}")
end

When(/^I retrieve beers matching with empty given  (.*) and (.*)$/) do |parm_1, parm_2|
  param = "?#{parm_1}=&#{parm_2}="
  @responce = @current_page.get_beers_with_empty_parameter(param)
end