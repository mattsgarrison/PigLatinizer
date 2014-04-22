class CreateWord < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word, allow_nil: false
    end
  end
end
