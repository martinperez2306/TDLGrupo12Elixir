var lobbyName = document.getElementById('lobbyName'); // name of Lobby

function createLobby(){
  var lobby = {
      name: lobbyName.value
  };

$.ajax({
  'type': 'POST',
  'url': 'http://localhost:4000/login',
  'Content-Type': 'application/json',
  'dataType': 'json',
  'data': JSON.stringify(lobby_id),
  'success': function(response)
   {
    getId(response);
   },
   'error': function(jqXHR, textStatus, errorThrown)
   {
       console.log('Error on saving appointment:', jqXHR, textStatus, errorThrown);
   }
});
}

function joinLobby(lobby_id){
  var user_lobby = {
    user_id:0,
    lobby_id:lobby_id
  }

  $.ajax({
    'type': 'POST',
    'url': 'http://localhost:4000/login',
    'Content-Type': 'application/json',
    'dataType': 'json',
    'data': JSON.stringify(lobby_id),
    'success': function(response)
     {
      getId(response);
     },
     'error': function(jqXHR, textStatus, errorThrown)
     {
         console.log('Error on saving appointment:', jqXHR, textStatus, errorThrown);
     }
  });
}
