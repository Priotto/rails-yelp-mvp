class ReviewsController < ApplicationController
  def new
    #Review pertence ao restaurante. É necessário as daus informações para criar uma instânia nova
    @restaurant = Restaurant.find(params[:restaurant_id]) #Selecionando um objeto do banco de dados através do ID
    @review = Review.new # Needed to instantiate the form_for
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id]) #Selecionando um objeto do banco de dados através do ID
    @review = Review.new(review_params) #Preenche as variáveis de instância do objeto da classe restaurante com os dados inputados no formulário.
    @review.restaurant = @restaurant #Vinculandoo objeto restaurant ao objeto review
    if @review.save # Will raise ActiveModel::ForbiddenAttributesError. Salva o objeto no banco de dados
      redirect_to restaurant_path(@restaurant) #Redireciona para o show, enviando como argumento um objeto do tipo restaurante
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
