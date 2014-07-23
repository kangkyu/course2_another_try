class CategoriesController < ApplicationController
  before_action :require_user, except: [:show]
  before_action :set_category, only: [:show, :edit, :update]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def show
    # @category = Category.find(params[:id])
  end

  def edit
    # @category = Category.find(params[:id])
  end

  def update
    # @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to @category
    else
      render 'edit'
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end