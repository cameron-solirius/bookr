require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  BROWSER = ENV['BROWSER'] || 'chrome_headless'

  case BROWSER
  when 'firefox'
    driven_by :selenium, using: :firefox, screen_size: [1400, 1400]
  when 'chrome_headless'
    driven_by :selenium_chrome_headless, screen_size: [1400, 1400]
  else
    driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  end
end