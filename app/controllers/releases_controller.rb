class ReleasesController < ApplicationController
  def index
    @releases = Release.where(list_id: params[:list_id])
  end

  def show
    @release = Release.find(params[:id])
  end

  def new
    @release = Release.new
    @list = List.find(params[:list_id])
  end

  def create
    @release = Release.new(release_params)
    @list = List.find(params[:list_id])
    @release.list = @list
    # response_from_api = discogsApi()
    @release.save

    redirect_to release_path(@release)
  end

  def edit
    @release = Release.find(params[:id])
  end

  def update
    @release = Release.find(params[:id])
    @release.update(release_params)
    redirect_to release_path(@release)
  end

  private

  def release_params
    params.require(:release).permit(:artist, :title, :label, :catalog_number, :format, :released, :styles, :tracklist, :link, :cover_url, :photo)
  end
end
