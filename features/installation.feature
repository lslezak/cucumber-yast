Feature: Test the openSUSE Leap 42.2 installation

  Scenario: Simple default installation
    Given the dialog heading should be "Language, Keyboard and License Agreement"
    And widget "License Agreement" should exist
    Then I click button "Next"

    Then the dialog heading should be "Installation Options"
    And check box "Add Online Repositories Before Installation" should not be checked
    And check box "Include Add-on Products from Separate Media" should not be checked
    Then I click button "Next"

    Then the dialog heading should be "Suggested Partitioning"
    Then I click button "Next"

    Then the dialog heading should be "Clock and Time Zone"
    And check box "Hardware Clock Set to UTC" should be checked
    Then I click button "Next"

    Then the dialog heading should be "Desktop Selection"
    Then I click button "Next"

    Then the dialog heading should be "Local Users"
    And I enter "John Cucumber" into input field "User's Full Name"
    And I enter "cucumber" into input field "Username"
    And I enter "cucumber" into input field "Password"
    And I enter "cucumber" into input field "Confirm Password"
    Then I click button "Next"

    Then widget "Yes" should exist
    And widget "No" should exist
    Then I click button "Yes"

    Then the dialog heading should be "Installation Settings"
    Then I click button "Install"

    Then widget "Install" should exist
    And widget "Back" should exist
    Then I click button "Install"
