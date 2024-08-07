class BooksController < ApplicationController
    def index
        @books = Book.all
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
