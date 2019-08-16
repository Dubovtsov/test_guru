user = User.new(
  first_name: 'Ivan',
  last_name: 'last_name',
  email: 'dubwin@yandex.ru',
  password: '123456789',
  password_confirmation: '123456789',
  type: 'Admin'
)
user.skip_confirmation!
user.save!

categories = Category.create([{title: :Ruby},{title: :Rails}, {title: :JS}, {title: :HTML}, {title: :CSS}])

tests = Test.create([{title: "Введение в Ruby", level: 1, category_id: categories[0].id, author_id: user.id},
                    {title: "Идиомы Ruby", level: 1, category_id: categories[0].id, author_id: user.id},
                    {title: "Миграции в Rails", level: 1, category_id: categories[1].id, author_id: user.id},
                    {title: "Генераторы Rails", level: 1, category_id: categories[1].id, author_id: user.id}])

questions = Question.create([{body: "Является ли Ruby объектно-ориентированным языком программирования?", test_id: tests[0].id},
                            {body: "Что такое DRY?", test_id: tests[1].id},
                            {body: "Является ли Ruby объектно-ориентированным языком программирования?", test_id: tests[2].id},
                            {body: "Что такое DRY?", test_id: tests[0].id}])

Answer.create(body: 'Да', correct: true, question_id: questions[0].id)
Answer.create(body: 'Нет', correct: false, question_id: questions[0].id)
Answer.create(body: 'Да', correct: false, question_id: questions[1].id)
Answer.create(body: 'Нет', correct: true, question_id: questions[1].id)
Answer.create(body: 'Да', correct: false, question_id: questions[3].id)
Answer.create(body: 'Нет', correct: true, question_id: questions[3].id)
