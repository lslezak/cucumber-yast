# Experimental Cucumber Tests for YaST

Here are some experimental Cucumber tests for YaST or plain libyui examples.

## Installation

```sh
bundle install --path ./.vendor/bundler
```

## Running

### Testing YaST Running on the Local Machine

- Run the YaST module (as `root`):
  ```sh
  YUI_CUCUMBER_DELAY=3000 YUI_CUCUMBER_PORT=3902 yast2 repositories
  ```
  The delay defines a sleep after simulating user input, this makes the progress
  of the changes better visible in the UI.

- Run the test:
  ```sh
  bundle exec cucumber features/adding_new_repo.feature
  ```

  [![Add Repository Screencast](images/add_repo.gif)](
    https://raw.githubusercontent.com/lslezak/cucumber-yast/master/images/add_repo.gif)

### Testing a Remote Instance

Because the Cucumber protocol uses a TCP port it is possible to run the tests
on a diffent machine. That means you can even run the tests during installation
in a virtual machine.

- Start a patched installer
- Set these environment variables
  - YUI_CUCUMBER_DELAY=3000
  - YUI_CUCUMBER_PORT=3902
  - YUI_CUCUMBER_REMOTE=1
- Edit the host name stored in the `features/step_definitions/cucumber.wire` file
- Run the test:
  ```sh
  bundle exec cucumber features/installation.feature
  ```
  [![Installation Screencast](images/install_leap_42.2.gif)](
    https://raw.githubusercontent.com/lslezak/cucumber-yast/master/images/install_leap_42.2.gif)

### Testing a Plain libyui Application

The Cucumber tests can used also for any application which uses the libyui
framework.

- Set these environment variables
  - YUI_CUCUMBER_DELAY=3000
  - YUI_CUCUMBER_PORT=3902
- Then run the libyui Application
- Start the Cucumber test

The [features/libyui_selectionbox2.feature](features/libyui_selectionbox2.feature)
contains a test for the [SelectionBox2.cc](
https://github.com/libyui/libyui/blob/master/examples/SelectionBox2.cc) example.

[![Libyui SelectionBox2 Example](images/libyui_selectionbox2.gif)](
  https://raw.githubusercontent.com/lslezak/cucumber-yast/master/images/libyui_selectionbox2.gif)

The [features/libyui_manywidgets.feature](features/libyui_manywidgets.feature)
contains a test for the [ManyWidgets.cc](
https://github.com/libyui/libyui/blob/master/examples/ManyWidgets.cc) example.

*Note: There seems to be a bug in the libyui-qt, right at the begining
there is an unprocessed event in the queue which is ignored, but it blocks
the Cucumber commands processing. As a workaround you need to press some
widget, e.g. the "Enabled" button and then start the Cucumber test.*

[![Libyui ManyWidgets Example](images/libyui_manywidgets.gif)](
  https://raw.githubusercontent.com/lslezak/cucumber-yast/master/images/libyui_manywidgets.gif)
