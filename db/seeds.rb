#user = User.new(
#  first_name: 'Ivan',
#  last_name: 'last_name',
#  email: 'dubwin@ya.ru',
#  password: '123456789',
#  password_confirmation: '123456789',
#  type: 'Admin'
#)
#user.skip_confirmation!
#user.save!

user = User.where(type: "Admin")

categories = Category.create([{title: :Ruby},{title: :Rails}, {title: :JS}, {title: :HTML}, {title: :CSS}])

tests = Test.create([{title: "Введение в HTML", level: 1, category_id: categories[3].id, author_id: user[0].id},
                    {title: "Введение в Ruby", level: 1, category_id: categories[0].id, author_id: user[0].id},
                    {title: "Ruby", level: 2, category_id: categories[0].id, author_id: user[0].id},
                    {title: "Ruby.Hero", level: 4, category_id: categories[0].id, author_id: user[0].id},
                    {title: "Миграции в Rails", level: 1, category_id: categories[1].id, author_id: user[0].id},
                    {title: "Генераторы Rails", level: 1, category_id: categories[1].id, author_id: user[0].id}])

questions = Question.create([{body: "Язык HTML - язык…", test_id: tests[0].id},
                            {body: "Между каким тэгом заключается документ HTML?", test_id: tests[0].id},
                            {body: "Какой из тэгов является непарным?", test_id: tests[0].id},
                            {body: "Какое расширение имеют Web-страницы?", test_id: tests[0].id}])

  Answer.create([{body: 'программирования', correct: false, question_id: questions[0].id},
                 {body: 'разметки страницы', correct: true, question_id: questions[0].id},
                 {body: 'общения', correct: false, question_id: questions[0].id}])
  Answer.create([{body: '<body></body>', correct: false, question_id: questions[1].id},
                 {body: '<head></head>', correct: false, question_id: questions[1].id},
                 {body: '<html></html>', correct: true, question_id: questions[1].id},
                 {body: '<div></div>', correct: false, question_id: questions[1].id}])
  Answer.create([{body: '<head>', correct: false, question_id: questions[2].id},
                 {body: '<br>', correct: true, question_id: questions[2].id},
                 {body: '<title>', correct: false, question_id: questions[2].id}])
  Answer.create([{body: '.txt', correct: false, question_id: questions[3].id},
                 {body: '.doc', correct: false, question_id: questions[3].id},
                 {body: '.html', correct: true, question_id: questions[3].id},
                 {body: '.exe', correct: false, question_id: questions[3].id}])

questions = Question.create([{body: "Где записана сокращенная форма кода: x = x / 3", test_id: tests[1].id},
                            {body: "Где указана пустая переменная (без какого-либо значения)?", test_id: tests[1].id},
                            {body: "Какой метод позволяет перевести строку в нижний регистр?", test_id: tests[1].id}])

  Answer.create([{body: 'Нет сокращенной формы', correct: false, question_id: questions[0].id},
                 {body: 'x /= 3', correct: true, question_id: questions[0].id},
                 {body: 'x/3', correct: false, question_id: questions[0].id},
                 {body: 'x =/ 3', correct: false, question_id: questions[0].id}])
  Answer.create([{body: 'some = 0', correct: false, question_id: questions[1].id},
                 {body: 'some = ""', correct: false, question_id: questions[1].id},
                 {body: 'some = null', correct: false, question_id: questions[1].id},
                 {body: 'some = nil', correct: true, question_id: questions[1].id}])
  Answer.create([{body: 'downcase()', correct: true, question_id: questions[2].id},
                 {body: 'lowercase()', correct: false, question_id: questions[2].id},
                 {body: 'down()', correct: false, question_id: questions[2].id},
                 {body: 'upcase()', correct: false, question_id: questions[2].id}])

questions = Question.create([{body: "Какой метод НЕ определяет область видимости методов?", test_id: tests[2].id},
                            {body: "При помощи какого ключевого слова можно досрочно прервать цикл?", test_id: tests[2].id},
                            {body: "Укажите метод, возвращающий базовый класс для класса Ticket?", test_id: tests[2].id}])

  Answer.create([{body: 'private', correct: false, question_id: questions[0].id},
                 {body: 'protected', correct: false, question_id: questions[0].id},
                 {body: 'public', correct: false, question_id: questions[0].id},
                 {body: 'attr', correct: true, question_id: questions[0].id}])
  Answer.create([{body: 'next', correct: false, question_id: questions[1].id},
                 {body: 'redo', correct: false, question_id: questions[1].id},
                 {body: 'break', correct: true, question_id: questions[1].id},
                 {body: 'continue', correct: false, question_id: questions[1].id}])
  Answer.create([{body: 'Ticket.parent', correct: false, question_id: questions[2].id},
                 {body: 'Ticket.class', correct: false, question_id: questions[2].id},
                 {body: 'Ticket.superclass', correct: true, question_id: questions[2].id},
                 {body: 'Ticket.base_class', correct: false, question_id: questions[2].id}])

questions = Question.create([{body: "Какой метод НЕ определяет область видимости методов?", test_id: tests[3].id},
                            {body: "При помощи какого ключевого слова можно досрочно прервать цикл?", test_id: tests[3].id},
                            {body: "Укажите метод, возвращающий базовый класс для класса Ticket?", test_id: tests[3].id}])

  Answer.create([{body: 'private', correct: false, question_id: questions[0].id},
                 {body: 'protected', correct: false, question_id: questions[0].id},
                 {body: 'public', correct: false, question_id: questions[0].id},
                 {body: 'attr', correct: true, question_id: questions[0].id}])
  Answer.create([{body: 'next', correct: false, question_id: questions[1].id},
                 {body: 'redo', correct: false, question_id: questions[1].id},
                 {body: 'break', correct: true, question_id: questions[1].id},
                 {body: 'continue', correct: false, question_id: questions[1].id}])
  Answer.create([{body: 'Ticket.parent', correct: false, question_id: questions[2].id},
                 {body: 'Ticket.class', correct: false, question_id: questions[2].id},
                 {body: 'Ticket.superclass', correct: true, question_id: questions[2].id},
                 {body: 'Ticket.base_class', correct: false, question_id: questions[2].id}])



BadgeRule.create([{name: 'all tests in the category'},
                  {name: 'the first test in the category'}])