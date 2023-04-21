class BooksController < ApplicationController
def index
  @books = Book.all
  @book = Book.new
  @book_posts = Book.new
end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def new
    @book = Book.new
  end
  
  def create
  @book_posts = Book.new(book_params)
  if @book_posts.save
    flash[:notice] = "Success"
    redirect_to book_path(@book_posts)
  else
    @books = Book.all
    flash.now[:alert] = "Error: Please fill in all fields."
    render :index
  end
  end

  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    #データ（レコード）を1件取得
    @book = Book.find(params[:id]) 
    # レコード削除
    @book.destroy
    # 投稿一覧画面へリダイレクト
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end
  
  private
  
  def book_params
    params.require('book').permit(:title, :body)
  end
  
end