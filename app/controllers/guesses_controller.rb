class GuessesController < ApplicationController
  def index

  end

  def create
    @guess = Guess.new(word: params[:guess][:word], game_id: params[:game_id])
    respond_to do |format|
      if @guess.save
        result = Compare.call(@guess.game.word, @guess.word).merge(guess_id: @guess.id)
        Result.create!(result)
        format.html { redirect_to game_path(@guess.game), notice: "bulls: #{@guess.result.bulls} cows: #{@guess.result.cows}" }
        format.json { render :show, status: :created, location: @guess.game }
      else
        format.html { render :new }
        format.json { render json: @guess.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def guess_params
    params.permit(:game_id).require(:guess).permit(:word)
  end
end
