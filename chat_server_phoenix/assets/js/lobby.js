var lobbyName = document.getElementById('lobbyName'); // name of Lobby

function createLobby(){
  var lobby = {
      name: lobbyName.value
  };

$.ajax({
  'type': 'POST',
  'url': 'http://localhost:4000/lobbies',
  'Content-Type': 'application/json',
  'dataType': 'json',
  'data': JSON.stringify(lobby_id),
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
  //Aca hacer el update del select o dropdown de lobbies
}

function joinLobby(lobby_id){
  window.location.href="/lobbies/"+lobby_id
}
