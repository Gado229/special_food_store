class CommentsController < ApplicationController
  before_action :set_food, only: [:create, :edit, :update]
  def create
    @food = Food.find(params[:food_id])
    @comment = @food.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to food_path(@food), notice: 'Impossible de commenter...' }
      end
    end
  end

  def edit
    @comment = @food.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end
  def update
    @comment = @food.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        flash.now[:notice] = 'コメントが編集されました'
        format.js { render :index }
      else
        flash.now[:notice] = 'コメントの編集に失敗しました'
        format.js { render :edit }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :content)
  end

  def set_food
    @food = Food.find(params[:food_id])
  end
end
