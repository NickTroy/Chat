$(document).on 'turbolinks:load', ->
  room_id = $('#messages').data('room-id')
  App.room = App.cable.subscriptions.create {
    channel: "RoomChannel", 
    room_id: room_id 
  },
  connected: ->
    # Called when the subscription is ready for use on the server
  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (data) ->
    $('#messages').append data['message']
    # Called when there's incoming data on the websocket for this channel
  speak: (message, room_id) ->
    @perform 'speak', message: message, room_id: room_id
 
$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  room_id = $('#messages').data('room-id')
  if event.keyCode is 13 # return = send
    App.room.speak event.target.value, room_id
    event.target.value = ""
    event.preventDefault()