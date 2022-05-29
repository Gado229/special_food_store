class FoodsController < ApplicationController
  before_action :set_food, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # GET /foods or /foods.json
  def index
    @foods = Food.all.order(id: "desc")
  end

  # GET /foods/1 or /foods/1.json
  def show
    @comments = @food.comments
    @comment = @food.comments.build
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
   #  if Food.find(params[:id]).user.name == current_user.name
   #   @food = Food.find(params[:id])
   # else
   #   redirect_to foods_path
   # end
      if Food.find(params[:id]).user.name == current_user.name
        @food = Food.find(params[:id])
      else
        redirect_to foods_path
      end
      unless @food.user_id == current_user.id
       redirect_to foods_path, notice: "Non autorisé."
      end
    end

  # POST /foods or /foods.json
  def create

    @food = current_user.foods.build(food_params)
    @restaurant.user_id = current_user.id

    respond_to do |format|
      if @food.save
        format.html { redirect_to food_url(@food), notice: "Food was successfully created." }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to food_url(@food), notice: "Food was successfully updated." }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url, notice: "Food was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_params
      params.require(:food).permit(:name, :phone, :description, :price, :image, :image_cache)
    end
end
