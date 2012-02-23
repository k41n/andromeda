class SessionsController < ApplicationController
  def create
    @player = Player.find_by_login_and_password(params[:session][:login], params[:session][:password])
    if @player
      session.clear
      session[:player_id] = @player.id
      @player.delay(:run_at => 10.seconds.from_now).update_resources
      redirect_to player_path(@player)
    else
      redirect_to new_session_path
    end
  end
end
