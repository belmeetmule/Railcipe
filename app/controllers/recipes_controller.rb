class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id).order(created_at: :desc)
  end

  def show
    @user = User.find(params[:user_id])
    @recipe = Recipe.find(params[:id])
    @foods = Food.all
    @recipe_foods = @recipe.recipe_foods.includes(:food, :recipe).order(:id)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @user = current_user
    @recipe = @user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to user_recipes_path(@user, @recipe)
    else
      render :new, alert: "Couldn't create recipe for user"
    end
  end

  def destroy
    @user = current_user
    @recipe = @user.recipes.find(params[:id])
    @recipe.destroy!
    redirect_to user_recipes_path
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public, :user_id)
  end
end
