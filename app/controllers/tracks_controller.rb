class TracksController < ApplicationController
  def update
    @track = Track.find(params[:id])
    @release = Release.find(@track.release_id)
    if @track.favorite?
      @track.favorite = false
    else
      @track.favorite = true
    end
    @track.save
    redirect_to release_path(@release), status: :see_other
  end
end
