require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # HEADED
  # driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  
  # HEADLESS
  driven_by :selenium_chrome_headless, screen_size: [1400, 1400]
end