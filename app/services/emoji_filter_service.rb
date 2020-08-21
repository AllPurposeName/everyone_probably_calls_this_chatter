class EmojiFilterService
  EMOJI_DELIMITER = ':'.freeze
  EXCLUDED_CHARS = '!@#$%^&*()[]{}\-|`~_;,<.>/?\'"'

  attr_reader :body

  def self.filter(body)
    new(body: body).filter
  end

  def initialize(body:)
    @body = body
  end

  def filter
    new_body = body.delete(EXCLUDED_CHARS).split(' ').each_with_object(body.clone) do |word, entire_body|
      if surrounded_by_delimiters?(word)
        short_name = word.gsub(EMOJI_DELIMITER,'').downcase
        if emoji[short_name]
          entire_body.gsub!(word, [emoji[short_name]['unified'].hex].pack("U"))
        end
      end
    end
  end

  def surrounded_by_delimiters?(word)
    word.start_with?(EMOJI_DELIMITER) && word.end_with?(EMOJI_DELIMITER)
  end

  def emoji
    @emoji ||=
      begin
        emoji_file = File.open("#{Rails.root}/lib/emoji_json_seed.json")
        emoji_json = JSON.parse(emoji_file.read)
        emoji_json.each_with_object({}) { |emoji, obj| emoji['short_names'].each { |short_name| obj[short_name] = emoji} }
      end
  end
end
