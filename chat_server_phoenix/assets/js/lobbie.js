
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

let channel = socket.channel('room:lobby', {}); // connect to chat "room" 
channel.join(); // join the channel.

let ul = document.getElementById('msg-list');        // list of messages.
let msg = document.getElementById('msg');            // message input field
let btnSend = document.getElementById('sendBtn');

channel.on('shout', function (payload) { // listen to the 'shout' event
  let li = document.createElement("li"); // create new list item DOM element
  let name = payload.name || 'guest';    // get name from payload or set default
  li.innerHTML = '<b>' + name + '</b>: ' + payload.message; // set li contents
  ul.appendChild(li);                    // append to list
});

// "listen" for the [Enter] keypress event to send a message:
btnSend.addEventListener('click', function (event) {
    if (msg.value.length > 0) { // don't sent empty msg.
        channel.push('shout', { // send the message to the server on "shout" channel
            message: msg.value    // get message text (value) from msg input field.
        });
        msg.value = '';         // reset the message input field for next message.
  }
});