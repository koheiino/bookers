class BooksController < ApplicationController
  def index
    # @booksはBookモデルモデルのオブジェクト一覧を格納する
    @books = Book.all
    # @bookは新規投稿用の空のBookオブジェクト.newで初期化
    @book = Book.new
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
    flash[:notice] = "success"
      redirect_to book_path(@book.id)

    else
      render :new
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
    # 投稿一覧画面へ
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end
  
  private
  
  def book_params
    params.require('book').permit(:title, :body)
  end
  
end