var lobbyName = document.getElementById('lobbyName'); // name of Lobby
var user = localStorage.getItem('user'); // name of user

function createLobby(){
  var lobby = {
      name: lobbyName.value
  };

$.ajax({
  'type': 'POST',
  'url': 'http://localhost:4000/lobbies',
  'Content-Type': 'application/json',
  'dataType': 'json',
  'data': lobby,
  'success': function(response)
   {
    updateLobbies(response);
   },
   'error': function(jqXHR, textStatus, errorThrown)
   {
       console.log('Error on saving appointment:', jqXHR, textStatus, errorThrown);
   }
});
}

function updateLobbies(){
  location.reload();
}

function joinLobby(lobby_id){
  localStorage.setItem('lobbyId', lobby_id);
  window.location.href="/lobbies/"+lobby_id+"/"+user
}

var modalButton = document.getElementById('createBtn'); // the button inside modal
modalButton.addEventListener('click', function () {
  createLobby();
});

// add event listener to all joins buttons
var joinButtons = document.querySelectorAll('button[id^=btnJoin-]');
joinButtons.forEach(btn => {
  btn.addEventListener('click', function () {
    joinLobby(btn.parentNode.getAttribute("id"));
  });
  
});
