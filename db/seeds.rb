# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name: 'Ivan', email: 'dubwin@yandex.ru')
# n = 1
# 5.times do
#   User.create(name: "Ivan-#{n += 1}", email: "dubwin-#{n}@yandex.ru")
# end

categories = Category.create([{title: :Ruby},{title: :Rails}, {title: :JS}, {title: :HTML}, {title: :CSS}])

tests = Test.create([{title: "Введение в Ruby", level: 1, category_id: categories[0].id, author_id: user.id},
                    {title: "Идиомы Ruby", level: 1, category_id: categories[0].id, author_id: user.id},
                    {title: "Миграции в Rails", level: 1, category_id: categories[1].id, author_id: user.id},
                    {title: "Генераторы Rails", level: 1, category_id: categories[1].id, author_id: user.id}])

question = Question.create([{body: "Является ли Ruby объектно-ориентированным языком программирования?", test_id: tests[0].id},
                            {body: "Что такое DRY?", test_id: tests[1].id}])

Answer.create(body: 'Да', correct: true, question_id: question[0].id)
Answer.create(body: 'Нет', correct: false, question_id: question[0].id)

