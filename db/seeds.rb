# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(login: 'Ivan', email: 'dubwin@yandex.ru')
n = 1
5.times do
  User.create(login: "Ivan-#{n += 1}", email: "dubwin-#{n}@yandex.ru")
end

categories = [:Ruby, :Rails, :JS, :HTML, :CSS]
categories.each { |c| Category.create(title: c) }


Test.create(title: 'Введение в Ruby', category_id: 1,)
Test.create(title: 'Идиомы Ruby', category_id: 1,)
Test.create(title: 'Миграции в Rails', level: 1, category_id:2,)
Test.create(title: 'Генераторы Rails', category_id: 2,)

Question.create(body: "Является ли Ruby объектно-ориентированным языком программирования", test_id: 1)

Answer.create(body: 'Да', correct: true, question_id: 1)
Answer.create(body: 'Нет', correct: false, question_id: 1)

CompletedTest.create(user_id: 1, test_id: 1)
