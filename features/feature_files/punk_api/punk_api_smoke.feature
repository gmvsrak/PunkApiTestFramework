Feature: Smoke Tests to test Punk API

  Background: Send request to Punk Api
    When I send request to punk api V2

  @smoke @regression
  Scenario: Able to Access Punk API
    And I retrieve beers
    Then I should get 200 responce
    And I should have list of beers

  @smoke @regression
  Scenario: Able to get single beer
    And I retrieve single beer
    Then I should get 200 responce
    And I should get 1 beer

  @smoke @regression
  Scenario: Able to get random beer
    And I retrieve random beer
    Then I should get 200 responce
    And I should get random beer data
    When I retrieve random beer
    Then I should get 200 responce
    And I should get other random beer data
    Then I compare random beers retrieved beers should be different
