class CaesarCipher
  @@alph = ('a'..'z').to_a.join ''

  def self.create(jump, text)
    new_text = ""
    text.downcase.chars.collect do |char|
      # Get the position from the chat in the alphabet.
      char_pos = @@alph.index(char)
      if !char_pos
        new_text += char
        next
      end
      
      # Get the next char using the alphabet
      new_char_pos = char_pos + jump
      if new_char_pos >= @@alph.length
        new_char_pos -= @@alph.length
      end

      # Add the char to the text
      new_text +=  @@alph[new_char_pos]
    end
    return new_text
  end
end

text = "Coe patraoz"
(0..25).to_a.each do |i|
  puts "Jump[#{i}]: '#{CaesarCipher.create(i, text)}'"
end