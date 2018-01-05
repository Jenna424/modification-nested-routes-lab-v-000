Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:index, :show, :new, :edit]
  end
  resources :songs
end

# Due to nested resource routes, we now have access to:

# route helper method #artist_songs_path(artist_id),
# which returns the string URL path "/artists/:artist_id/songs"
# mapped to the #index action (method) of SongsController
# to display the index of all songs by (i.e. belonging to) a specific artist

# route helper method #artist_song_path(artist_id, song_id)
# which returns the string URL path "/artists/:artist_id/songs/:id"
# mapped to the #show action (method) of SongsController
# to show a specific song belonging to a specific artist

# route helper method #new_artist_song_path(artist_id),
# which returns the string URL path "/artists/:artist_id/songs/new"
# mapped to the #new action (method) of SongsController
# to create a new song instance automatically belonging to the artist instance
# user had clicked Create New Song link on the artist show page,
# which led to "/artists/:artist_id/songs/new" page displaying form to create a new song belonging to the artist
# we know who the artist is

# route helper method #edit_artist_song_path(artist_id, song_id),
# which returns the string URL path "/artists/:artist_id/songs/:id/edit"
# mapped to the #edit action (method) of SongsController
# to edit a specific song by a specific artist
