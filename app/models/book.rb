class Book < ApplicationRecord
  def new
    @book = Book.new
    
  end
  def index
    @books = Book.all
  end
end
