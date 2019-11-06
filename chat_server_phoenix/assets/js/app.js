// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

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
  $.ajax({
    'type': 'POST',
    'url': 'http://localhost:4000/login',
    'Content-Type': 'application/javascript',
    'data': {
      "email" : email,
      "pass" : pass
    },
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
