class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new # Needed to instantiate the form_for
  end

  def create
    @restaurant = Restaurant.new(restaurant_params) #Preenche as variáveis de instância do objeto da classe restaurante com os dados inputados no formulário.
    if @restaurant.save # Will raise ActiveModel::ForbiddenAttributesError. Salva o objeto no banco de dados
      redirect_to restaurant_path(@restaurant) #Redireciona para o show, enviando como argumento um objeto do tipo restaurante
    else
      render :new, status: :unprocessable_entity

    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
