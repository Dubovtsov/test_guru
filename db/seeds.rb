user = User.new(
  first_name: 'Ivan',
  last_name: 'last_name',
  email: 'dubwin@ya.ru',
  password: '123456789',
  password_confirmation: '123456789',
  type: 'Admin'
)
user.skip_confirmation!
user.save!

user = User.where(type: "Admin")

categories = Category.create([{title: :Ruby},{title: :Rails}, {title: :JS}, {title: :HTML}, {title: :CSS}])

tests = Test.create([{title: "Введение в HTML", level: 1, category_id: categories[3].id, author_id: user[0].id},
                    {title: "Идиомы Ruby", level: 1, category_id: categories[0].id, author_id: user[0].id},
                    {title: "Миграции в Rails", level: 1, category_id: categories[1].id, author_id: user[0].id},
                    {title: "Генераторы Rails", level: 1, category_id: categories[1].id, author_id: user[0].id}])

questions = Question.create([{body: "Язык HTML - язык…", test_id: tests[0].id},
                            {body: "Между каким тэгом заключается документ HTML?", test_id: tests[0].id},
                            {body: "Какой из тэгов является непарным?", test_id: tests[0].id},
                            {body: "Какое расширение имеют Web-страницы?", test_id: tests[0].id}])

Answer.create(body: 'программирования', correct: false, question_id: questions[0].id)
Answer.create(body: 'разметки страницы', correct: true, question_id: questions[0].id)
Answer.create(body: 'общения', correct: false, question_id: questions[0].id)

Answer.create(body: '<body></body>', correct: false, question_id: questions[1].id)
Answer.create(body: '<head></head>', correct: false, question_id: questions[1].id)
Answer.create(body: '<html></html>', correct: true, question_id: questions[1].id)
Answer.create(body: '<div></div>', correct: false, question_id: questions[1].id)

Answer.create(body: '<head>', correct: false, question_id: questions[2].id)
Answer.create(body: '<br>', correct: true, question_id: questions[2].id)
Answer.create(body: '<title>', correct: false, question_id: questions[2].id)

Answer.create(body: '.txt', correct: false, question_id: questions[3].id)
Answer.create(body: '.doc', correct: false, question_id: questions[3].id)
Answer.create(body: '.html', correct: true, question_id: questions[3].id)
Answer.create(body: '.exe', correct: false, question_id: questions[3].id)

BadgeRule.new(name: 'all test')