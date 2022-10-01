class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  # 投稿データの保存、バリデーション
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id) #BookのShowへ
      flash[:complete] = "You have created book successfully." 
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

# このindex部分は確認してもらったから合っている
  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

# 上の３行確認済
  def show
    @book = Book.find(params[:id])
    @user = current_user
    @book_new = Book.new
  end
  
  def edit
    @book = Book.find(params[:id])
    @user = current_user
    # ↑試しに追加してみた。
  end
  
  # def update
  #   book = Book.find(params[:id])
  #   book.update(book_params)
  #   redirect_to book_path(book.id)
  #   flash[:complete] = "You have updated book successfully."
  # end
  
  #バリエーション（投稿の更新が失敗したとき） 
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:complete] = "You have updated book successfully."
    else
      @user = current_user
      render :edit
    end
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
