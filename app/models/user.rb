class User < ApplicationRecord
  has_many :completed_tests

  def tests_by_level(level)
    Test.includes(:completed_tests).where(completed_tests: { user_id: 1 })
  # Добавить условие
  end
end

# Создайте инстанс-метод в модели User,
# который принимает в качестве аргумента
# значение уровня сложности и возвращает
# список всех Тестов, которые проходит или
# когда-либо проходил Пользователь на этом уровне сложности
