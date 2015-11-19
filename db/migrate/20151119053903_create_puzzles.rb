class CreatePuzzles < ActiveRecord::Migration
  def change
    create_table :puzzles do |t|
      t.string :secret_word
      t.integer :guesses, default: 0

      t.timestamps null: false
    end
  end
end
