class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    #createアクションでstrong parameterのメソッドを呼び出す
    @user = User.create(users_params)

    if @user.save
      redirect_to users_path
      # redirect_to user_path(@user), success: '新規登録しました!「新規投稿する」から投稿してみましょう!'
    else
      render 'new'
    end
  end


  #詳細表示
  def show
    @user = User.find(params[:id])
  end

  #編集
  def edit
    # 編集するユーザーの情報を取得
    @user = User.find(params[:id])
  end


  #更新
  def update
    @user = User.find(params[:id])
    @user.update(users_params)
    redirect_to user_path(@user)
  end

  # 削除
  def destroy
    # URLのidからUserモデルデータに一致するidを見つけ、ユーザー特定
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end


  private
    # ------------------------------------------------------------------
      #ストロングパラメータを定義
    # ------------------------------------------------------------------
    def users_params
      params.require(:user).permit(:name, :age, :birthplace, :gender, :birth_date, :how_are_you)
    end



end
