class Word < ActiveRecord::Base
  has_many :translations

  validates_presence_of :word
  validates_format_of :word, with: /\A[a-zA-Z]+\z/

  def add_translation(type)
    case type
    when :pig_latin
    else
      "This is not a valid translation type"
    end
  end
end