class CommentsController < ApplicationController
  before_action :set_prototype, only: [:create]

  def create
    @comment = @prototype.comments.build(comment_params)

    if @comment.save
      redirect_to prototype_path(@prototype), notice: 'コメントを保存しました。'
    else
      # エラー処理などを行う場合のコード
      render 'prototypes/show'
    end
  end
  private

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end

def comment_params
  params.require(:comment).permit(:text).merge(user_id: current_user.id)
end
end