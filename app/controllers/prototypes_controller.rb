class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  
  def index
    @prototypes = Prototype.all
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    #↪︎prototypesコントローラーのshowアクションに、@commentというインスタンス変数を定義し、Commentモデルの新規オブジェクトを代入した
    @comments = @prototype.comments.includes(:prototype)
    #↪︎showアクションにインスタンス変数@commentsを定義し、その投稿に紐づくすべてのコメントを代入するための記述をした
  end


  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      redirect_to new_prototype_path(new)
    end
  end

  def edit
    @prototype = Prototype.find(params[:id])
    #↪︎editアクションにインスタンス変数@prototypeを定義した。且つ、Pathパラメータで送信されるID値で、Prototypeモデルの特定のオブジェクトを取得するように記述し、それを@prototypeに代入した
    if @prototype.user.id != current_user.id
      redirect_to action: :index
    end
  end

  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to prototype_path(prototype.id), method: :get
      #↪︎updateアクションにデータを更新する記述をし、更新されたときはそのプロトタイプの詳細ページに戻るような記述をした
    else
      render :edit
      #↪︎updateアクションに、データが更新されなかったときは、編集ページに戻るようにrenderを用いて記述した
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
    #↪︎destroyアクションに、プロトタイプを削除し、トップページに戻るような記述をした
  end


  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  
end
