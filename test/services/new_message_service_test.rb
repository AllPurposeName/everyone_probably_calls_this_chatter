require 'test_helper'

class NewMessageServiceTest < ActiveSupport::TestCase
  def test_filters_bodies_with_emoji_triggers
    example_body = "Hello world we have liftoff :rocket: :rocket: :rocket:"
    service = NewMessageService.new(
      body: example_body,
      user: users(:nora),
      chat_room: chat_rooms(:one)
    )

    actual = service.filtered_body
    expected = "Hello world we have liftoff 🚀 🚀 🚀"

    assert_equal expected, actual
  end

  def test_creates_a_message_with_the_body
    example_body = "What's up my hume?"
    service = NewMessageService.new(
      body: example_body,
      user: users(:nora),
      chat_room: chat_rooms(:one)
    )

    expected = Message.count + 1
    service.create!
    actual = Message.count

    assert_equal expected, actual
  end
end
