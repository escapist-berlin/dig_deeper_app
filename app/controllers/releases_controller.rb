# require 'json'

class ReleasesController < ApplicationController
  def index
    @releases = Release.where(list_id: params[:list_id])
  end

  def show
    @release = Release.find(params[:id])
    @list = List.find(@release.list_id)
    @tracklist = Track.where(release_id: @release.id)
  end

  def new
    @release = Release.new
    @list = List.find(params[:list_id])
  end

  def create
    @release = Release.new(release_params)
    @list = List.find(params[:list_id])
    @release.list = @list
    @release.save

    redirect_to release_path(@release)
  end

  def edit
    @release = Release.find(params[:id])
  end

  def update
    raise
    @release = Release.find(params[:id])
    @release.update(release_params)
    redirect_to release_path(@release)
  end

  def destroy
    @release = Release.find(params[:id])
    @release.destroy

    redirect_to dashboard_path, status: :see_other
  end

  private

  def release_params
    params.require(:release).permit(
      :artist,
      :title,
      :label,
      :catalog_number,
      :format,
      :released,
      :styles,
      :cover_url,
      :photo,
      :comment,
      :link,
      :favorite_tracks
    )
  end
end
