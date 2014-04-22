class Translation < ActiveRecord::Base
  belongs_to :word

  validates_presence_of :translated_word
end