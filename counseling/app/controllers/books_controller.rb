class BooksController < ApplicationController
  before_action :authenticate
  before_action :load_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = current_user.books.all
  end

  def new
    @book = Book.new
  end

  def show
    if @book.nil?
      redirect_to books_path, alert: "Book not found"
    
    end
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      redirect_to books_path, notice: "Book was successfully created."
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      render edit , status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, alert: "Book was successfully deleted."
  end

  private 

  def load_book
    @book = current_user.books.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :price)
  end
end
