# require 'json'

class ReleasesController < ApplicationController
  def index
    @releases = Release.where(list_id: params[:list_id])
  end

  def show
    @release = Release.find(params[:id])
    @list = List.find(@release.list_id)
    @tracklist = Track.where(release_id: @release.id).order(:position)
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
    @release = Release.find(params[:id])
    respond_to do |format|
      if @release.update(release_params)
        format.html { redirect_to release_path(@release), status: :see_other }
        # format.text { render partial: "shared/tracklist", locals: { tracklist: @tracklist }, formats: [:html] }
      else
        format.html { render "releases/show", status: :unprocessable_entity }
      end
    end

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
      :tag
    )
  end
end
