Feature: User management
  As an administrator
  In order to manage users on my site
  I want to create and edit users.

  Background:
    Given I am logged as "admin"
    And I go to "Users" in "Admin" tab

  @javascript @common
  Scenario: Create a new user
    When I start creating a new user
    And I set content fields for user
      | label       | value     |
      | First name  | testuser  |
      | Last name   | lastname  |
    And I set content fields for user
      | label         | Username  | Password    | Confirm password  | Email          | Enabled  |
      | User account  | testuser  | Test1234pw  | Test1234pw        | test@test.com  | Yes      |
    And I click on the edit action bar button "Create"
    Then I should be on content item page "testuser lastname" of type "User" in "Users"
    And content attributes equal
      | label       | value     |
      | First name  | testuser  |
      | Last name   | lastname  |
    And content attributes equal
      | label         | Username | Email          | Enabled  |
      | User account  | testuser | test@test.com  | Yes      |

  @javascript @common
  Scenario: Editing an existing user
    When I open UDW and go to "Users/testuser lastname"
    And I click on the edit action bar button "Edit"
    And I set content fields for user
      | label       | value          |
      | First name  | testuseredited |
      | Last name   | lastnameedited |
    And I set content fields for user
      | label         | Username  | Password    | Confirm password  | Email          |
      | User account  | testuser  | Test123456  | Test123456        | test@test.org  |
    And I click on the edit action bar button "Update"
    Then I should be on content item page "testuseredited lastnameedited" of type "User" in "Users"
    And content attributes equal
      | label       | value           |
      | First name  | testuseredited  |
      | Last name   | lastnameedited  |
    And content attributes equal
      | label         | Username  | Email          | Enabled  |
      | User account  | testuser  | test@test.org  | Yes      |
    