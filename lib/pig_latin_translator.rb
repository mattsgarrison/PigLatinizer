class PigLatinTranslator
  VOWELS = %w{A E I O U}
  attr_accessor :word

  def initialize(word=nil)
    @word = word
  end

  def translation
    return nil if !@word

    begins_with_vowel? ? vowel_translation : nil
  end

  private

  def begins_with_vowel?
    VOWELS.include?(word.first.upcase)
  end

  def vowel_translation
    @word+"ay"
  end
end