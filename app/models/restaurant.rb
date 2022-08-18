class Restaurant < ApplicationRecord #Active record, renponsável por mapear modelo e banco de dados
  has_many :reviews, dependent: :destroy #Relação de cardinalidade. Dependent destroy: Se apagar o restaurante as reviews também são deletadas

  #Validação variáveis de instância do objeto da classe Restaurant
  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]
  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
