document.addEventListener('turbolinks:load', function() {
  var interval;

  // var sec=localStorage.getItem("time") || 10;

  function countdown() {
    clearInterval(interval);

    interval = setInterval( function() {
      var timer = $('.test-timer').html();
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
      // localStorage.setItem('time', minutes + ':' + seconds);
      if (minutes == 0 && seconds == 0) {
        clearInterval(interval);
        submitForm()
      }
    }, 1000);
  }
  countdown();
});

function submitForm() {
  var formTag = document.querySelector('#test-passage-form')
  if (formTag) { formTag.submit() }
}
