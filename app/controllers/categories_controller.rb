class CategoriesController < ApplicationController

  def new
    @sub_categories = Category.where(parent_id: params[:category_id])
    respond_to do |format|
      format.html
      format.json
    end
  end
end
