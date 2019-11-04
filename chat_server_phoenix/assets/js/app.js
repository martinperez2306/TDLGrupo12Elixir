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
console.log("gesdd")       // name of message sender
let btn = document.getElementById('loginBtn');


btn.addEventListener('click', function () {
  
  let pass = document.getElementById('pass');        // list of messages.
  let email = document.getElementById('email');   
  if (pass.value.length > 0 && email.value.length > 0) { // don't sent empty msg.
    $.ajax({
      'type': 'POST',
      'url': 'http://localhost:4000/login',
      'data': { 
        email : email.value,
        pass : pass.value},
      'success': function(response)
       {
        $("html").html(response);
       },
       'error': function(jqXHR, textStatus, errorThrown)
       {
           console.log('Error on saving appointment:', jqXHR, textStatus, errorThrown);    
       }
   });
}});  


