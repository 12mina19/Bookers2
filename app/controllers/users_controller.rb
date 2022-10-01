class UsersController < ApplicationController
  
  # ここいらない　Byメンター
  # def new
  #   @book = Book.new
  # end
  
  # ここいらない　Byメンター
  # 投稿データの保存
  # def create
  #   @book = Book.new(book_params)
  #   @book.user_id = current_user.id
  #   @book.save
  #   redirect_to book_path(@book.id) #BookのShowへ
  # end
  
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    # 特定のユーザ(@user)に関連付けられた(.books)を取得し、@booksに渡す
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  
  # def update
  #   @user = User.find(params[:id])
  #   @user.update(user_params)
  #   redirect_to user_path(@user.id)
  #   flash[:complete] = "You have updated user successfully."
  # end
  
  # ユーザー名の文字数制限のために上の記述を書き換えてみた
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:complete] = "You have updated user successfully."
    else
      render :edit
    end
  end
  
  

  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end

