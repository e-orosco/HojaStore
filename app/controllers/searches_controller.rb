class SearchesController < ApplicationController
  def show
    if params[:query].present?
      @products = Product.search_by_full_name(params[:query])
    else
      @products = Product.all
    end
  end
  
  # def show
  #  palabra = params[:palabra]
  #end
  
end
