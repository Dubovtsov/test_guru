document.addEventListener('turbolinks:load', function() {
  var control = document.getElementById('test-passage-form')
  if (control) {
    var interval;
// счетчик не должен обнуляться при переходе на следующий вопрос или обновлении страницы
    function countdown() {
      clearInterval(interval);

      interval = setInterval( function() {
        var timer = localStorage.getItem("time") || $('.test-timer').html();
        // localStorage.getItem("time") ||
        timer = timer.split(':');
        var minutes = timer[0];
        var seconds = timer[1];
        seconds -= 1;

        if (minutes < 0) return;
        else if (seconds < 0 && minutes != 0) {
          minutes -= 1;
          seconds = 59;
        }
        else if (seconds < 10 && length.seconds != 2) seconds = '0' + seconds;

        $('.test-timer').html(minutes + ':' + seconds);
        if (minutes == 0 && seconds == 0) {
          clearInterval(interval);
          submitForm()
        }
        localStorage.setItem('time', minutes + ':' + seconds);
      }, 1000);
    }
    countdown();
  }
})

function submitForm() {
  var formTag = document.querySelector('#test-passage-form')
  if (formTag) { formTag.submit() }
}
