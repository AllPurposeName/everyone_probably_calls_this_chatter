import consumer from "./consumer"

$(document).on('turbolinks:load', () => {
consumer.subscriptions.create(
  {
    channel: "ChatChannel",
    chat_room_id: $('.messages').attr('data-chat-room-id'),
  },
  {
    connected() {

    },

    disconnected() {
    },

    received(data) {
      $('.messages').append(`<p class="align-right">${data['message']['body']}  --  ${data['message']['current_user']}</p>`)
      $('#message_body').val(null)
    }
  });
});
