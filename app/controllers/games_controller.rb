class GamesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @games = Game.all
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      flash[:notice] = "Game was successfully created"
      redirect_to game_path(@game)
    else
      flash.now[:error] = "An error occurred while saving this game"
      #render :new
    end
  end

def show
  @game = Game.find(params[:id])
end

def new
@game = Game.new
end


def edit
  @game = Game.find(params[:id])
end

def update
  @game = Game.find(params[:id])
     if @game.update(game_params)
       redirect_to game_path(@game), notice: "Game was successfully updated!"
     else
       flash.now[:error] = "An error occurred when updating this game"
       render :edit
     end
end

def destroy
  @game = Game.find(params[:id])
  @game.destroy
  redirect_to games_path, notice: "Game was successfully deleted"
end


  private

#   def find_character
#     @character = Character.find(params[:id])
#   end

def game_params
  params.require(:game).permit(:title, :genre, :description, :launch_date)
end

end
