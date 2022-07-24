class CommentsController < ApplicationController
  before_action :set_food, only: [:create, :edit, :update]

  def create
    @comment = @food.comments.build(comment_params)
    @food = Food.find(params[:food_id])
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save!
        format.js { render :index }
      else
        format.html { redirect_to food_path(@food), notice: 'Impossible de commenter...' }
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'Commentaire réécrit avec succès'
      format.js { render :edit }
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @food = @comment.food
    respond_to do |format|
      if @comment.update(comment_params)
        flash.now[:notice] = 'Commentaire modifié avec succès'
        format.js { render :index }
      else
        flash.now[:notice] = 'Échec de la modification du commentaire'
        format.js { render :edit }
      end
    end
  end

  def destroy
    @food = Food.find(params[:food_id])
    @comment = @food.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'Commentaire supprimé avec succès'
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
