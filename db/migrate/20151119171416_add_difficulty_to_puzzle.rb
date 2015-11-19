class AddDifficultyToPuzzle < ActiveRecord::Migration
  def change
    add_column :puzzles, :difficulty, :integer
    add_column :puzzles, :words, :string
  end
end
