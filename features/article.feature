Feature: Article
  In order to view a pdf
  I want to be shown the viewer

  Scenario Outline: Viewing a pdf
    Given I have gone to article 1 show page
    When I view the page
    Then I should see the viewer