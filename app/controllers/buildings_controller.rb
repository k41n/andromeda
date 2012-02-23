class BuildingsController < ApplicationController
  layout false

  def begin_upgrading
    @building = Building.find(params[:id])
    @planet = @building.planet
    @building.begin_upgrade
    @building.delay(:run_at => @building.next_level_time.from_now).upgrade
  end
end
