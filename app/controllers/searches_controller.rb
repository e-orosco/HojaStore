class SearchesController < ApplicationController
  def show
    palabra = params[:palabra]
    @products = Product.where("MATCH(title, description) AGAINST(?)", palabra)
    
  end
end
