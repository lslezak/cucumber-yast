Feature: Test a plain libyui application

  Scenario: Test the `SelectionBox2` example app from libyui
    # test the initial state
    Given widget "Menu" should exist
    And check box "Notify Mode" should not be checked
    And check box "Immediate Mode" should not be checked

    # check the checkboxes
    When I check check box "Notify Mode"
    And I check check box "Immediate Mode"

    # press a button
    Then I click button "Value"

    # uncheck the checkboxes back
    Then I uncheck check box "Immediate Mode"
    Then I uncheck check box "Notify Mode"

