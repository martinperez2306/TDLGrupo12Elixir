let btn = document.getElementById('loginBtn'); //login btn

function getId(response) {
  $.ajax({
    'type': 'GET',
    'url': 'http://localhost:4000/lobbies',
    'Content-Type': 'application/javascript',
    'data': {
      "id": response.id,
    },
    'success': function (response) {
      window.location.replace("http://localhost:4000/lobbies");
    },
    'error': function (jqXHR, textStatus, errorThrown) {
      console.log('Error on saving appointment:', jqXHR, textStatus, errorThrown);
    }
  });
};


// post user and email
function login(email, pass) {
  var user = {
    email: email,
    pass: pass,
  };

  $.ajax({
    'type': 'POST',
    'url': 'http://localhost:4000/login',
    'Content-Type': 'application/javascript',
    'dataType': 'json',
    'data': user,
    'success': function (response) {
      localStorage.setItem('user', email);
      getId(response);
    },
    'error': function (jqXHR, textStatus, errorThrown) {
      console.log('Error on saving appointment:', jqXHR, textStatus, errorThrown);
    }
  });
};


// listen event to click
btn.addEventListener('click', function () {
  let pass = document.getElementById('pass');           // value of password
  let email = document.getElementById('email');         // value of mail
  if (pass.value.length > 0 && email.value.length > 0) { // check if both are not empty
    login(email.value, pass.value);
  }

});
