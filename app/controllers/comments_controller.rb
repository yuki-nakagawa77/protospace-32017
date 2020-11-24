class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    #binding.pry
    if @comment.save
    redirect_to prototype_path(@comment.prototype), method: :post
    #↪︎createアクションに、データが保存されたときは詳細ページにリダイレクトされるよう記述をした
    else
      @prototype = Prototype.find(params[:prototype_id])
      @comments = @prototype.comments.new(comment_params)
      render "/prototypes/show"
      #↪︎createアクションに、データが保存されなかったときは詳細ページに戻るようrenderを用いて記述した
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
    #↪︎commentsコントローラーのprivateメソッドにストロングパラメーターをセットし、特定の値のみを受け付けるようにした。且つ、user_idとprototype_idもmergeした
  end

end
