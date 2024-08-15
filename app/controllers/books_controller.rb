class BooksController < ApplicationController
    def index
        @books = Book.all

        if params[:search].present?
            search_term = params[:search].downcase
            @books = @books.where('LOWER(title) LIKE ? OR LOWER(author) LIKE ?', "%#{search_term}%", "%#{search_term}%")
        end

        @books_unfinished = @books.where(finished: false)
        @books_finished = @books.where(finished: true)
        
        @books_unfinished_sort_by_created = @books_unfinished.order(created_at: :desc)
        @books_finished_sort_by_finished_date = @books_finished.order(finishedDate: :desc)
        @books_finished_sort_by_stars = @books_finished.order(stars: :desc)

        @sort_by_stars = params[:sort_by] == 'stars'
    end
 
    def landing
        @books = Book.all
    end

    def new
        @book = Book.new()
    end
 
    def create
        @book = Book.new(book_params)
        @book.finishedDate = Date.today if @book.finished
        if @book.save
            redirect_to books_path
        else
            render :new
        end
    end

    def show
        @book = Book.find(params[:id])
    end

    def edit
        @book = Book.find(params[:id])
      end
    
      def update
        @book = Book.find(params[:id])
        
        if !@book.finished && book_params[:finished] == "1"
          @book.finishedDate = Date.today
        end
      
        if @book.update(book_params)
          redirect_to @book
        else
          render :edit
        end
      end

    def destroy
        Book.find(params[:id]).destroy
        redirect_to books_path
    end
 
    private
 
    def book_params
        params.require(:book).permit(:title, :author, :stars, :finished, :finishedDate, :thoughts)
    end
end
