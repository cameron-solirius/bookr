require "application_system_test_case"

class HomesTest < ApplicationSystemTestCase
  test "visiting the landing page" do
    visit root_url
  
    # sleep 2

    assert_selector "h1", text: "Welcome to Bookr"
  end

  test "visiting the My Books page" do
    visit books_path

    assert_selector "h1", text: "My Books"
  end

  test "visiting the New Book page" do
    visit new_book_path

    assert_selector "h1", text: "New Book"
  end

end
