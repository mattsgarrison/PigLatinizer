class PigLatinTranslator
  VOWELS = %w{A E I O U}
  attr_accessor :word

  def initialize(word=nil)
    @word = word
  end

  def translation
    return nil if !@word
  end
end