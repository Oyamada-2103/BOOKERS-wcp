class BooksController < ApplicationController

  # rails4章で追加
  def index
    # rails５章で追加 eachメソッド
    @books = Book.all

    # rails４章で追加
    @book = Book.new
  end


  # rails4章で追加
  def create
    # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    @books = Book.all
    # ２. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      # ３. トップ画面へリダイレクト
      # redirect_to '/top'
      # ５章で追加 詳細画面へリダイレクト
      redirect_to book_path(@book.id), notice:'Book was successfully created.'
      # redirect_to '/books/new/:id'
    else
      render "new"
    end
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
    @books = Book.all
    @book = Book.find(params[:id])
      if @book.update(book_params)
        redirect_to book_path(@book.id), notice:'Book was successfully updated.'
      else
        render "edit"
      end
  end

  # rails 8章削除機能追加
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books', notice:'Book was successfully destroyed.'
  end

#これが１番下に来るようにする
  # 4章で追加
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
