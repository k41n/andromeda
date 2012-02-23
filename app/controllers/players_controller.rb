class PlayersController < ApplicationController
  before_filter :find_player, :except => [:new, :create]
  before_filter :init_viewport

  def create
    player = Player.create(params[:player])
    session[:player_id] = player.id
    redirect_to player_path(player)
  end

  def objects
    logger.info(session[:viewport_center])
    width = params[:width].to_i
    height = params[:height].to_i
    left = session[:viewport_center][0] - width/2
    right = session[:viewport_center][0] + width/2
    top = session[:viewport_center][1] - height/2
    bottom = session[:viewport_center][1] + height/2
    @objects = Planet.visible_in(left,top,right,bottom)
    render :layout => false
  end

private
  def find_player
    @player = Player.find(session[:player_id]) if session[:player_id]
    redirect_to new_session_path if @player.nil?
  rescue
    redirect_to new_session_path
  end

  def init_viewport
    session[:viewport_center] ||= [@player.planets.first.x,@player.planets.first.y] if @player
  end
end
