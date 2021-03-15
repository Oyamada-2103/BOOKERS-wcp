class BooksController < ApplicationController

  # rails4章で追加
  def new
    # rails５章で追加 eachメソッド
    @books = Book.all

    # rails４章で追加
    @book = Book.new
  end


  # rails4章で追加
  def create
    # １. データを新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    book.save
    # ３. トップ画面へリダイレクト
    # redirect_to '/top'
    # ５章で追加 詳細画面へリダイレクト
    redirect_to book_path(book.id), notice:'Book was successfully created.'
    # redirect_to '/books/new/:id'

  end

  def show
    @book = Book.find(params[:id])
  end

  # rails6章edit機能
  def edit
    @book = Book.find(params[:id])
  end

  # rails6章editのdb更新
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id), notice:'Book was successfully updated.'
  end

  # rails 8章削除機能追加
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books/new'
  end

#これが１番下に来るようにする
  # 4章で追加
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
