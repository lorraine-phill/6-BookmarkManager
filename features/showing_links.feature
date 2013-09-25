Feature: Show my links
In order to save me from having to remember sites I have visited and enjoyed
As a user
I want to be able to see my previously saved links

Scenario: When there are no links
Given I am on the homepage
Then there should be no links

Scenario: When there are links
Given I am on the homepage
When I have previously saved some links
Then I should see a list of links



