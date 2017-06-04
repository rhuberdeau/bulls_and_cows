class Compare
  def self.call(game_word, guess_word)
    hash = {bulls: 0, cows: 0}
    guess_word.chars.each_with_index do |value, index|
      if game_word.chars[index] == value
        hash[:bulls] += 1
      elsif game_word.chars.include? value
        hash[:cows] += 1
      end
    end
    hash
  end
end
