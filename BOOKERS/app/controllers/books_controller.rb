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
    redirect_to '/top'
  end

  def show
    @book = Book.find(params[:id])
  end


#これが１番下に来るようにする
  # 4章で追加
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
