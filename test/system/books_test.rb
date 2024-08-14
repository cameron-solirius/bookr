require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  # Backend tests
  # Validation
  test "should save valid book" do
    book = FactoryBot.create(:book)
    assert book.save
  end

  test "should save unfinished book" do
    book = FactoryBot.create(:book, :unfinished)
    assert book.save
  end

  # Scope tests
  test "should return only finished books" do
    Book.delete_all
    FactoryBot.create(:book, finished: true)
    FactoryBot.create(:book, :unfinished)

    finished_books = Book.where(finished: true)
    assert_equal 1, finished_books.count, "Failed to return the correct number of finished books"
  end

  test "should return books sorted by stars" do
    Book.delete_all
    book1 = FactoryBot.create(:book, finished: true, stars: 4.0)
    book2 = FactoryBot.create(:book, finished: true, stars: 3.0)
    book3 = FactoryBot.create(:book, finished: true, stars: 5.0)

    sorted_books = Book.where(finished: true).order(stars: :desc)
    assert_equal [book3, book1, book2], sorted_books, "Books are not sorted correctly by stars"
  end

  test "should return books sorted by finished date" do
    Book.delete_all
    book1 = FactoryBot.create(:book, finished: true, finishedDate: Date.yesterday)
    book2 = FactoryBot.create(:book, finished: true, finishedDate: Date.today)
    book3 = FactoryBot.create(:book, finished: true, finishedDate: Date.tomorrow)

    sorted_books = Book.where(finished: true).order(finishedDate: :desc)
    assert_equal [book3, book2, book1], sorted_books, "Books are not sorted correctly by finished date"
  end

  # Edge case tests
  test "should handle finishedDate properly when book is marked finished" do
    book = FactoryBot.create(:book, :unfinished)
    assert_nil book.finishedDate, "Finished date should be nil for unfinished book"

    book.update(finished: true, finishedDate: Date.today)
    assert_not_nil book.finishedDate, "Finished date should be set when book is marked finished"
    assert_equal Date.today, book.finishedDate, "Finished date should be today's date"
  end

  test "should retain finishedDate when updating other attributes" do
    book = FactoryBot.create(:book, finished: true, finishedDate: Date.yesterday)
    book.update(title: "Updated Title")
    assert_equal Date.yesterday, book.finishedDate, "Finished date should not change when updating other attributes"
  end

  test "should allow different books with the same author" do
    FactoryBot.create(:book, author: "Same Author", title: "First Title")
    another_book = FactoryBot.build(:book, author: "Same Author", title: "Second Title")
    assert another_book.save, "Failed to save a book with the same author but different title"
  end

  # FRONTEND

  setup do
    # Using FactoryBot to create books instead of using fixtures
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

  test "should reset finishedDate if book is marked unfinished and then finished" do
    book = FactoryBot.create(:book, finished: true, finishedDate: Date.yesterday)
    book.update(finished: false)
    assert_equal false, book.finished

    visit edit_book_url(book)

    fill_in "Title", with: "The Great Gatsby"
    check "Finished"
    click_on "Save changes"
    assert_text "My Books"
    assert_equal "The Great Gatsby", book.title
    assert_equal true, book.finished

    assert_equal Date.today, book.finishedDate, "Finished date should be reset when book is marked unfinished and then finished"
  end
end
