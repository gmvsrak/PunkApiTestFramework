Feature: Regression Test to test Punk API

  Background: Send request to Punk Api
    When I send request to punk api V2

    #Generates random dynamic data for every scenario which would help test different data at any given point
  @regression
  Scenario: Generate random test data
    And I retrieve random beer
    Then I build dynamic data

  @regression @smoke @test
  Scenario: Able to retrieve beers matching with beer_name
    When I retrieve beers with a given beer_name
    Then I should get 200 responce
    And The retrieved beers should match with provided beer_name

  @regression
  Scenario: Able to retrieve beers matching with yeast name
    When I retrieve beers with a given yeast_name
    Then I should get 200 responce
    And The retrieved beers should match with provided yeast_name

  @regression
  Scenario: Able to retrieve beers matching with hops name
    When I retrieve beers with a given hops_name
    Then I should get 200 responce
    And The retrieved beers should match with provided hops_name

  @regression
  Scenario: Able to retrieve beers before given date
    When I retrieve beers with a given before_date
    Then I should get 200 responce
    And The retrieved beers should be brewed before_date

  @regression
  Scenario: Able to retrieve beers after given date
    When I retrieve beers with a given after_date
    Then I should get 200 responce
    And The retrieved beers should be brewed after_date

  @regression
  Scenario: Able to retrieve beers before current date
    When I retrieve beers with a given current_date
    Then I should get 200 responce
    And The retrieved beers should be brewed current_date

  @regression
  Scenario: Able to retrieve beers matching with given food name
    When I retrieve beers with a given food_name
    Then I should get 200 responce
    And The retrieved beers should match with provided food_name

  @regression
  Scenario: Able to retrieve beers matching with given malt name
    When I retrieve beers with a given malt_name
    Then I should get 200 responce
    And The retrieved beers should match with provided malt_name

  @regression
  Scenario: Able to retrieve beer with matching ID
    When I retrieve beers with a given matching_ID
    Then I should get 200 responce
    And The retrieved beers should match with provided matching_ID

  @regression
  Scenario Outline: Get beers with given 2 parameters
    When I retrieve beers matching with 2 given <parm_1> and <parm_2> only
    Then I should get 200 responce
    And The retrieved beers should match with 2 given <parm_1> and <parm_2> only
    Examples:
      |parm_1| parm_2 |
      |beer_name  |hops_name    |
      |beer_name  |yeast_name   |
      |matching_ID    |yeast_name    |

  @regression
  Scenario Outline: Get beers with given 3 parameters
    When I retrieve beers matching with 3 given <parm_1> and <parm_2> and <parm_3> parameters
    Then I should get 200 responce
    And The retrieved beers should match with 3 given <parm_1> and <parm_2> and <parm_3> parameters
    Examples:
    |parm_1| parm_2 | parm_3|
    |beer_name  |hops_name    |yeast_name  |
    |malt_name  |hops_name    |yeast_name     |
    |matching_ID    |beer_name     |malt_name       |

  @regression
  Scenario Outline: Get beers with given 4 parameters
    When I retrieve beers matching with 4 given <parm_1> and <parm_2> and <parm_3> and <parm_4> parameters only
    Then I should get 200 responce
    And The retrieved beers should match with 4 given <parm_1> and <parm_2> and <parm_3> and <parm_4> parameters only
    Examples:
      |parm_1| parm_2 | parm_3| parm_4|
      |beer_name  |hops_name    |yeast_name  | malt_name|
      |malt_name  |hops_name    |yeast_name     | matching_ID|


    #Negative Scenarios
  @regression
  Scenario: Should not be able to retrieve beers with invalid endpoint
    When I retrieve beers with a invalid endpoint
    Then I should get 404 responce

  @regression
  Scenario: Should not be able to retrieve beers with empty food parameter
    When I retrieve beers with a empty food parameters
    Then I should get 400 responce

  @regression
  Scenario Outline: Get beers with empty parameters
    When I retrieve beers matching with empty given  <parm_1> and <parm_2>
    Then I should get 400 responce
    Examples:
      |parm_1| parm_2 |
      |name  |hops    |

  @regression
  Scenario: Should not be able to retrieve beers matching with invalid beer_name
    When I retrieve beers with a invalid beer_name parameter
    Then I should get 200 responce
    And The responce should be empty

#  Scenario: Should not be able to retrieve beers matching with invalid yeast name
#    When I retrieve beers with a invalid yeast name
#    Then I should get 200 responce
#    And The responce should be empty
#
#  Scenario: Should not be able to retrieve beers matching with invalid hops name
#    When I retrieve beers with a invalid hops name
#    Then I should get 200 responce
#    And The responce should be empty
#
#  Scenario: Should not be able to retrieve beers matching with invalid date
#    When I retrieve beers with a invalid date
#    Then I should get 200 responce
#    And The responce should be empty



