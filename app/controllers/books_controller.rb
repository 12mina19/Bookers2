class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id) #BookのShow（本の情報）にとぶようにメンターが編集した
  end

# このindex部分は確認してもらったから合っている
  def index
    @books = Book.all
    @user = current_user 
  end

# 上の３行確認済
  def show
    @book = Book.find(params[:id])
    @user = current_user
    @book_new = Book.new
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
    # ここに：imageはいらない
  end
  
end
