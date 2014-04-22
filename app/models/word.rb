class Word < ActiveRecord::Base

  validates_presence_of :word
  validates_format_of :word, with: /\A[a-zA-Z]\z/
end