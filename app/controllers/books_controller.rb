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
        if @book.save
            redirect_to root_url
        else
            render :new
        end
    end

    def destroy
        Book.find(params[:id]).destroy
        redirect_to root_url
    end
 
    private
 
    def book_params
        params.require(:book).permit(:title)
    end
end
