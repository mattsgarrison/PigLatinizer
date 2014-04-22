class CreateTranslation < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.integer :word_id
      t.string  :type
      t.string  :translated_word
    end
  end
end
