document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.test-timer')
  if (control) {
    var interval

    function countdown() {
      clearInterval(interval)
      interval = setInterval( function() {
        var timer = sessionStorage.getItem('time') || $('.test-timer').html()
        timer = timer.split(':')
        var minutes = timer[0]
        var seconds = timer[1]

        if (minutes == 0 && seconds == 0){
          console.log(sessionStorage.getItem('time'))
          clearInterval(interval)
          submitForm()
          return false
        }
        else if (minutes !== 0 && seconds !== 0) {
          seconds -= 1
        }

        if (minutes < 0) return;
        else if (seconds < 0 && minutes != 0) {
          minutes -= 1;
          seconds = 59;
        }
        else if (seconds < 10 && length.seconds != 2) seconds = '0' + seconds
        sessionStorage.setItem('time', minutes + ':' + seconds)

        $('.test-timer').html(minutes + ':' + seconds)
        if (minutes == 0 && seconds == 0) {
          clearInterval(interval)
          submitForm()
        }
      }, 1000)
    }
    countdown()
  }
  else {
    sessionStorage.clear()
  }
})

function submitForm() {
  var formTag = document.querySelector('#test-passage-form')
  if (formTag) { formTag.submit() }
}
