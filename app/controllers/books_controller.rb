class BooksController < ApplicationController
  def index
    @all_book = Book.all
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_param)
    if @book.save
      redirect_to @book
    else
      render 'books/new'
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_param)
      redirect_to @book
    else
      render 'books/edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  private
  def book_param
    params.require(:book).permit(:name, :author, :isbn_number)
  end
end


