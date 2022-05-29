class RestaurantsController < ApplicationController
    before_action :set_food, only: [:create, :edit, :update]
  def create
    @food = Food.find(params[:food_id])
    @restaurant = @food.restaurants.build(restaurant_params)
    @restaurant.user_id =current_user.id

    respond_to do |format|
      if @restaurant.save
        format.js { render :index }
      else
        format.html { redirect_to food_path(@food), notice: 'Impossible de restauranter...' }
      end
    end
  end

  def edit
    @restaurant = @food.restaurants.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end
  def update
    @restaurant = @food.restaurants.find(params[:id])
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        flash.now[:notice] = 'コメントが編集されました'
        format.js { render :index }
      else
        flash.now[:notice] = 'コメントの編集に失敗しました'
        format.js { render :edit }
      end
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :adress, :phone)
  end

  def set_food
    @food = Food.find(params[:food_id])
  end
end
