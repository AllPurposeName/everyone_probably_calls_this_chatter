require 'test_helper'

class EmojiFilterServiceTest < MiniTest::Test
  def test_surrounded_by_delimiters
    service = EmojiFilterService.new(body: "")

    samples = ":hello: :why: :don't: :you: :thumbsup: :some: :people:".split(' ')
    samples.each do |sample|
      actual_surrounded = service.surrounded_by_delimiters?(sample)
      assert actual_surrounded
    end
  end

  def test_not_surrounded_by_delimiters
    service = EmojiFilterService.new(body: "")

    samples = "hello ;why; don't you :thumbsup some people:".split(' ')
    samples.each do |sample|
      actual_surrounded = service.surrounded_by_delimiters?(sample)
      refute actual_surrounded
    end
  end

  def test_filter_replaces_correct_word_with_utf_symbol
    service = EmojiFilterService.new(body: "Hello there :wave:!")
    actual = service.filter
    expected = "Hello there 👋!"

    assert_equal expected, actual
  end

  def test_filter_does_not_replace_correct_word_with_utf_symbol
    service = EmojiFilterService.new(body: "Hello there :wave dance:!")
    actual = service.filter
    expected = "Hello there :wave dance:!"

    assert_equal expected, actual
  end
end

