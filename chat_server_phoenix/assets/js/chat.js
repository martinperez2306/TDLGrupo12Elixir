import socket from "./socket"

var path = window.location.pathname.split('/');
var room = localStorage.getItem('lobbyId');
var channel = socket.channel('chat:' + room, {}) // connect to chat with lobby id
channel.on('shout', function (payload) { // listen to the 'shout' event
  if (document.getElementById(payload.id) == null) { // check if message exists.
    var li = document.createElement("li"); // creaet new list item DOM element
    li.id = payload.id
    console.log(payload)
    var name = payload.name || 'guest';    // get name from payload or default
    li.innerHTML = '<p><b>' + sanitise(name)
      + '</b>: ' + sanitise(payload.message) + '</p> <br />';
    ul.appendChild(li);                    // append to list
  }
});

/**
 * sanitise input to avoid XSS see: https://git.io/fjpGZ
 * function borrowed from: https://stackoverflow.com/a/48226843/1148249
 * @param {string} str - the text to be sanitised.
 * @return {string} str - the santised text
 */
function sanitise(str) {
  const map = {
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#x27;',
    "/": '&#x2F;',
  };
  const reg = /[&<>"'/]/ig;
  return str.replace(reg, (match) => (map[match]));
}

channel.join() // join the channel.
  .receive("ok", resp => { console.log("Joined chat!", resp) })

var ul = document.getElementById('msg-list');        // list of messages.
var name = document.getElementById('name');          // name of message sender
var msg = document.getElementById('msg');            // message input field
var sendBtn = document.getElementById('sendBtn');    // send btn

// "listen" for the [Enter] keypress event to send a message:
msg.addEventListener('keypress', function (event) {
  if (event.keyCode == 13) {
    send();
  }
});

// "listen" for the click event to send a message:
sendBtn.addEventListener('click', function () {
  send();
});

// funciton to send message and name
function send() {
  if (msg.value.length > 0) { // don't sent empty msg.
    console.log(msg.value)
    channel.push('shout', { // send the message to the server
      name: sanitise(name.value), // get value of "name" of person sending
      message: sanitise(msg.value), // get message text (value) from msg input
      lobby_id: room // Payload have the lobby id
    });
    msg.value = '';         // reset the message input field for next message.
  }
}