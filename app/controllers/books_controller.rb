class BooksController < ApplicationController
  def index
    @book = Book.all
  end
  
  def show

  end
  
  def new
    @book = Book.new
  end
  
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # 4. トップ画面へリダイレクト
    redirect_to '/top'
  end
  
  def edit

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
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end
  
  private
  
  def book_params
  end
  
  
end