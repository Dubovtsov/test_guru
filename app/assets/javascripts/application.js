// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets

document.addEventListener('turbolinks:load', function() {

  var confirmPass = document.getElementById('user_password_confirmation')

  if (confirmPass) { confirmPass.addEventListener('keyup', function() {
    var pass = document.getElementById('user_password').value
    var input = document.getElementById('user_password_confirmation').value

    if (input == pass) {
      confirmPass.classList.remove('border-red')
      confirmPass.classList.add('border-green')
      document.querySelector('.octicon-x').classList.add('hide')
      document.querySelector('.octicon-check').classList.remove('hide')
    } else {
      confirmPass.classList.add('border-red')
      document.querySelector('.octicon-x').classList.remove('hide')
      document.querySelector('.octicon-check').classList.add('hide')
    }

    })
  }
})
