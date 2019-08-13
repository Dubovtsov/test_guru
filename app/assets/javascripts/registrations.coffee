document.addEventListener 'turbolinks:load', ->
  confirmPass = document.getElementById('user_password_confirmation')
  if confirmPass
    confirmPass.addEventListener 'keyup', ->
      pass = document.getElementById('user_password').value
      input = document.getElementById('user_password_confirmation').value

      if input
        if input == pass
          confirmPass.classList.remove 'border-red'
          confirmPass.classList.add 'border-green'
          document.querySelector('.octicon-x').classList.add 'hide'
          document.querySelector('.octicon-check').classList.remove 'hide'
        else
          confirmPass.classList.add 'border-red'
          document.querySelector('.octicon-x').classList.remove 'hide'
          document.querySelector('.octicon-check').classList.add 'hide'
        return

      else
        confirmPass.classList.remove 'border-red'
        confirmPass.classList.remove 'border-green'
        document.querySelector('.octicon-x').classList.add 'hide'
        document.querySelector('.octicon-check').classList.add 'hide'
  return
