class TracksController < ApplicationController
  def update
    @track = Track.find(params[:id])
    @release = Release.find(@track.release_id)
    if @track.favorite?
      @track.favorite = false
    else
      @track.favorite = true
    end

    respond_to do |format|
      if @track.save
        format.html { redirect_to release_path(@release), status: :see_other }
        format.text { render partial: "shared/tracklist", locals: { tracklist: @tracklist }, formats: [:html] }
      else
        format.html { render "releases/show", status: :unprocessable_entity }
      end
      format.json
    end
  end
end
