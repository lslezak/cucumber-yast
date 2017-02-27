Feature: Test a plain libyui application
  NOTE: This does NOT work properly, for some reason there is an unprocessed UI
  event present just after starting the example (YComboBox "Editable:"
  ValueChanged event). And it blocks processing the Cucumber requests... :-(
  
  As a workaround you need to press some widget to trigger another event
  which will override it. E.g. press the "Enabled" button. Then you can
  start this test.

  Scenario: Test the `ManyWidgets` example app from libyui
    # test the initial state
    Given widget "Label" should exist
    And widget "CheckButton" should exist
    And widget "Event Loop" should exist
    

    # test the initial state
    Given widget "PushButton" should exist
    And widget "CheckButton" should exist
    And widget "Event Loop" should exist
    And check box "Check0" should not be checked
    # note a typo in the label!
    And check box "Ckeck1" should be checked

    # activate a check box
    When I check check box "Check0"
    Then check box "Check0" should be checked

    # click push button
    When I click button "Enabled"

    # enter values
    Then I enter "test" into input field "Public:"
    And I enter "haha!" into input field "Secret:"

    # open a popup
    When I click button "Popup"
    Then widget "Let it BEEP!" should exist
    And widget "Beep" should exist

    # close the popup
    Then I click button "Quit"
