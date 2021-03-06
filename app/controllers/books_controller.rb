class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
      redirect_to book_path(@book)
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def index
    @user = current_user
    @books = Book.all
    @newbook = Book.new
  end

  def edit
  end

private

def book_params
  params.require(:book).permit(:title, :body)
end

end
