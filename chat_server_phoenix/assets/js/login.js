let btn = document.getElementById('loginBtn');

function getId(response) {
    $.ajax({
      'type': 'GET',
      'url': 'http://localhost:4000/lobbies',
      'Content-Type': 'application/javascript',
      'data': {
        "id" : response.id,
      },
      'success': function(response)
       {
        $("html").html(response);
       },
       'error': function(jqXHR, textStatus, errorThrown)
       {
          console.log('Error on saving appointment:', jqXHR, textStatus, errorThrown);
       }
    });
};

function login(email, pass){
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
    'success': function(response)
     {
      getId(response);
     },
     'error': function(jqXHR, textStatus, errorThrown)
     {
         console.log('Error on saving appointment:', jqXHR, textStatus, errorThrown);
     }
 });
};

btn.addEventListener('click', function () {
  let pass = document.getElementById('pass');        // list of messages.
  let email = document.getElementById('email');
  if (pass.value.length > 0 && email.value.length > 0) { // don't sent empty msg.
   login(email.value, pass.value);
  }

});
