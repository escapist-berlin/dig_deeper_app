class PagesController < ApplicationController
  $super_search_query = ""

  def home
  end

  def dashboard
    if current_user
      @list = List.find_by(title: 'spotlight', user: current_user)
      @releases = Release.where(list_id: @list.id).order(created_at: :desc)
    else
      redirect_to root_path
    end
  end

  def results
    @search_query = params['search']['title']
    $super_search_query = @search_query
    @release = discogs_api(@search_query)
    @cover_image = discogs_api_img(@search_query)
    @list = List.find_by(title: 'spotlight', user: current_user)
    if @release.nil? && @cover_image.nil?
      # TODO!!! flash-alert
    end
  end

  def save_btn
    # Making an API request
    @search_query = $super_search_query
    @release = discogs_api(@search_query)
    @cover_image = discogs_api_img(@search_query)
    @list = List.find_by(title: 'spotlight')

    # Creating a new release
    new_api_release = Release.new(
      artist: @release.artists[0].name,
      title: @release.title,
      label: @release.labels.first.name,
      catalog_number: @release.labels.first.catno,
      format: @release.formats.first.name,
      released: @release.released,
      styles: @release.styles,
      cover_url: @cover_image
    )
    new_api_release.list = @list
    new_api_release.save

    # Creating tracks
    @release.tracklist.map do |track|
      Track.create(
        title: track.title,
        favorite: false,
        position: track.position,
        release_id: new_api_release.id
      )
    end
    # new_api_release.save

    redirect_to dashboard_path
  end

  private

  def discogs_api(search_input)
    wrapper = Discogs::Wrapper.new('DigDeeper')
    auth_wrapper = Discogs::Wrapper.new('DigDeeper', user_token: 'woLJMkIArTDEQgXUMPAAuNacoDrNRjoZRUVoVZLU')

    search = auth_wrapper.search(search_input, :per_page => 1)
    release_id = search.results.first.id.to_s
    wrapper.get_release(release_id)
  end

  def discogs_api_img(search_input)
    wrapper = Discogs::Wrapper.new('DigDeeper')
    auth_wrapper = Discogs::Wrapper.new('DigDeeper', user_token: 'woLJMkIArTDEQgXUMPAAuNacoDrNRjoZRUVoVZLU')

    search = auth_wrapper.search(search_input, :per_page => 1)
    search.results.first.cover_image
  end
end
