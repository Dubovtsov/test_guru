class Test < ApplicationRecord
  belongs_to :category

  def self.sort_by_category(category)
    Test.where(category_id: category)
  end
end

# Создайте метод класса в модели Test, 
# который возвращает отсортированный 
# по убыванию массив названий всех Тестов 
# у которых Категория называется определённым 
# образом (название категории передается в метод в качестве аргумента).
