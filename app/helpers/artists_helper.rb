module ArtistsHelper
  def display_artist(song)
    song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
  end

  def artist_select(artist, song)
    if params[:artist_id] # user edits song through nested routing at "/artists/:artist_id/songs/:id/edit"
      artist.name
    else # user edits song directly via "/songs/:id/edit", so we create dropdown of artist options
      select_tag "song[artist_id]", options_from_collection_for_select(Artist.all, :id, :name)
    end
  end
end

# Remember: the nested :edit resource route in config/routes.rb
# provided the route helper method #edit_artist_song_path(artist_id, song_id),
# which returns the string URL path "/artists/:artist_id/songs/:id/edit"
# where user edits song through nested routing
