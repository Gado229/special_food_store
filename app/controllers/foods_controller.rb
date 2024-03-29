class FoodsController < ApplicationController
  before_action :set_food, only: %i[ show edit update destroy ]
  PER = 5

  def top
  end

  # GET /foods or /foods.json
  def index
    @foods = Food.all.order(id: "desc").page params[:page]
    @users = User.all
  end

  # GET /foods/1 or /foods/1.json
  def show
    @comments = @food.comments
    @comment = @food.comments.build
  end

  # GET /foods/new
  def new
    @food = Food.new
    @restaurants = Restaurant.all.order(name: "asc").page params[:page]
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods or /foods.json
  def create
    # @food = current_user.foods.build(food_params)
    @food = Food.new(food_params.merge(user_id: current_user.id))
    if params[:back]
        render :new
     else
    respond_to do |format|
      if @food.save
        format.html { redirect_to food_url(@food), notice: "Publié avec succès." }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to food_url(@food), notice: "Mis à jour succès." }
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
      format.html { redirect_to foods_url, notice: "Spprimé avec succès." }
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
      params.require(:food).permit(:name, :description, :price, :image, :image_cache, :user_id, :restaurant_id)
    end
end
