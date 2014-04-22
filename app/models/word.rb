class Word < ActiveRecord::Base
  has_many :translations do
    def pig_latin
      where(type: "PigLatin")
    end
  end

  validates_presence_of :word
  validates_format_of :word, with: /\A[a-zA-Z]+\z/

  def add_translation(type)
    case type
    when :pig_latin
      translator = PigLatinTranslator.new(word)
      translation = self.translations.pig_latin.create(translated_word: translator.translation)
      translation.try(:translated_word)
    else
      "This is not a valid translation type"
    end
  end
end