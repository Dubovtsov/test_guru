document.addEventListener('turbolinks:load', function() {
  var questionCard = document.querySelector('.question-card')
  if (questionCard) {
    var progress = document.querySelector('#progress')
    var current = progress.dataset.currentQuestionNumber
    var count = progress.dataset.questionsCount
    var oneQuestion = 1/count*100
    var percent = current/count*100
    var progressBar = document.querySelector('progress')
    progressBar.value = percent - oneQuestion
  }
})
