class WordsController < ApplicationController

  def new
    @word = Word.new
  end

  def create
    word = Word.create(word_params)
    if word.persisted?
      pig_translation = word.add_translation(:pig_latin)
      notice = "Your word in Pig Latin is #{pig_translation}"
    else
      notice = "Your word was invalid"
    end

    redirect_to root_path, notice: notice
  end

  private

  def word_params
    params.require(:word).permit(:word)
  end
end