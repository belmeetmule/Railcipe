class GeneralShoppingListsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.find(params[:recipe_id])

    @recipe_foods = @recipe.recipe_foods.includes(:food).order(:id)

    @missing_foods = @recipe_foods.select { |recipe_food| recipe_food.quantity > recipe_food.food.quantity }

    @general_shopping_lists = @missing_foods.map do |missing_food|
      {
        name: missing_food.food.name,
        quantity: missing_food.quantity - missing_food.food.quantity,
        measurement_unit: missing_food.food.measurement_unit,
        price: missing_food.food.price * (missing_food.quantity - missing_food.food.quantity)
      }
    end
  end
end
