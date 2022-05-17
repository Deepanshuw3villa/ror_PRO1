class CategoriesController < ApplicationController
  def index
    @allcategory = Category.all
  end

  def new
    @newcategory = Category.new
  end

  def create
    @createcategory = Category.new(category_params)

    @createcategory.save
    redirect_to categories_path
  end


  private

  def category_params
    params.require(:category).permit(:name)

  end
end
