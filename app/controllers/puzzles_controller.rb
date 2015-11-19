class PuzzlesController < ApplicationController
  def index
  end

  def new
    @puzzle = Puzzle.new
  end

  def create
    @puzzle = Puzzle.new(puzzle_params)
    respond_to do |format|
      if @puzzle.save
        format.html { redirect_to puzzle_path(@puzzle) }
        format.json { render json: @puzzle, status: :created }
      else
        format.html { render :new }
        format.json { render json: @puzzle.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @puzzle = Puzzle.find(params[:id])
    respond_to do |format|
      if @puzzle.update(puzzle_params.except(:guess))
        format.json { render json: {msg: @puzzle.guess(params[:puzzle][:guess])} }
      else
        format.html { render :show }
        format.json { render json: @puzzle.errors }
      end
    end
  end

  def show
    @puzzle = Puzzle.find(params[:id])
  end

private

  def puzzle_params
    params.require(:puzzle).permit(:difficulty,:guess)
  end
end
