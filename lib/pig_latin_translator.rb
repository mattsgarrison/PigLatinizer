class PigLatinTranslator
  VOWELS = %w{A E I O U}
  attr_accessor :word

  def initialize(word=nil)
    @word = word
  end

  def translation
    return nil if !@word

    begins_with_vowel? ? vowel_translation : consonant_translation
  end

  private

  def begins_with_vowel?
    VOWELS.include?(word.first.upcase)
  end

  def vowel_translation
    @word+"ay"
  end

  def consonant_translation
    @word << @word.slice!(0)
  end
end