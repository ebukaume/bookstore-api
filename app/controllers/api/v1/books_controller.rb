class Api::V1::BooksController < ApplicationController
  def index
    render json: get_all_books('success')
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      render json: get_all_books('success')
    else
      render json: get_all_books('failure')
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      render json: get_all_books('success')
    else
      render json: get_all_books('failure')
    end

  end
  private

  def get_all_books(status)
    books = Book.all.as_json(only: [:id, :title, :author, :category])
    {status:status, data:books}
  end

  def book_params
    params.require(:book).permit(:title, :author, :category)
  end
end
