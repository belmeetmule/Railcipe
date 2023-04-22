class PublicRecipesController < ApplicationController
  def index
    @index ||= Recipe.includes([:user]).where(public: true).order(created_at: :desc)
  end
end
