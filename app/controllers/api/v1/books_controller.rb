# frozen_string_literal: true

class Api::V1::BooksController < ApplicationController
  def index
    render json: get_all_books('SUCCESS')
  end

  def create
    book = Book.new(book_params)
    if book.save
      render json: { status: 'SUCCESS', book: book }
    else
      render json: { status: 'FAILURE', book: book }
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      render json: { status: 'SUCCESS', book: book }
    else
      render json: { status: 'FAILURE', book: book }
    end
  end

  private

  def get_all_books(status)
    books = Book.all.as_json(only: %i[id title author category])
    { status: status, books: books }
  end

  def book_params
    params.require(:book).permit(:title, :author, :category)
  end
end
