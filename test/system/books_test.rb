require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  # Backend tests

  test "should save valid book" do
    book = FactoryBot.create(:book)
    assert book.save
  end

  test "should save unfinished book" do
    book = FactoryBot.create(:book, :unfinished)
    assert book.save
  end

  # Frontend tests

  setup do
    # Use FactoryBot to create books instead of using fixtures
    @book = FactoryBot.create(:book)
    @book_two = FactoryBot.create(:book, title: "Second Book Title", author: "Another Author")
  end

  test "visiting the index" do
    visit books_url
    assert_selector "h1", text: "My Books"
    assert_text @book.title
    assert_text @book_two.title
  end

  test "viewing a book's details" do
    visit book_url(@book)
    assert_selector "h1", text: @book.title
    assert_text @book.author
    assert_text @book.thoughts
    assert_text @book.stars.to_s
    assert_text @book.finishedDate.to_s
  end

  test "creating a new finished book" do
    visit new_book_url
    fill_in "Title", with: "The Great Gatsby"
    fill_in "Author", with: "F. Scott Fitzgerald"
    check "Finished"
    fill_in "Stars", with: 4.0
    fill_in "Thoughts", with: "A classic read."
    click_on "Create Book"

    assert_text "The Great Gatsby"
    assert_text "F. Scott Fitzgerald"
  end

  test "creating a new unfinished book" do
    visit new_book_url
    fill_in "Title", with: "Ready Player One"
    fill_in "Author", with: "Ernest Cline"
    click_on "Create Book"

    assert_text "Ready Player One"
    assert_text "Ernest Cline"
  end


  test "should not save book without title" do
    visit new_book_url
    fill_in "Title", with: ""
    fill_in "Author", with: "Mr Writer"
    click_on "Create Book"

    assert_text "New Book"
  end

  test "updating a book" do
    visit edit_book_url(@book)
    fill_in "Title", with: "Updated Title"
    fill_in "Thoughts", with: "Updated thoughts."
    click_on "Save changes"

    assert_text "Updated Title"
    assert_text "Updated thoughts."
  end

  test "deleting a book" do
    @book_del = FactoryBot.create(:book, title: "This book is scheduled for execution")
    visit books_url
    assert_text @book_del.title
    within(:xpath, "//div[@data-book-id='#{@book_del.id}']") do
      accept_confirm do
        click_on "Delete"
      end
    end
    assert_text "My Books"
    assert_no_text @book_del.title
  end

  test "landing page displays book count" do
    visit root_url
    assert_selector "h2", text: "#{Book.count} books added!"
  end

  test "books are sorted by stars on index page" do
    visit books_url(sort_by: 'stars')
    books_sorted_by_stars = Book.where(finished: true).order(stars: :desc)
    books_sorted_by_stars.each do |book|
      assert_selector '.book', text: book.title
    end
  end

  test "books are displayed correctly on index page when sorted by date" do
    visit books_url
    books_sorted_by_date = Book.where(finished: true).order(finishedDate: :desc)
    books_sorted_by_date.each do |book|
      assert_selector '.book', text: book.title
    end
  end

  test "form toggles visibility based on finished checkbox" do
    visit new_book_url
    check "Finished"
    assert_selector '.toggle-fields', visible: true
    uncheck "Finished"
    assert_selector '.toggle-fields', visible: false
  end
end
