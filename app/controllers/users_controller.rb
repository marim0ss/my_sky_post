class UsersController < ApplicationController
  def index
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


  private
    # ------------------------------------------------------------------
      #ストロングパラメータを定義
    # ------------------------------------------------------------------
    def users_params
      params.require(:user).permit(:name, :age, :birthplace, :gender, :birth_date, :how_are_you)
    end



end
