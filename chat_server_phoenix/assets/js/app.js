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

let pass = document.getElementById('pass');        // list of messages.
let email = document.getElementById('email');          // name of message sender
let msg = document.getElementById('loginBtn');            // message input field

// "listen" for the [Enter] keypress event to send a message:
msg.addEventListener('keypress', function (event) {
  if ( name.length > 0) { // don't sent empty msg.
    $.post( "http://localhost:4000/login", { email: email, pass: pass } );
    console.log("sended");
    pass.value = '';
    name.value = '';         // reset the message input field for next message.
  }
});
