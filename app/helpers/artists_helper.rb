module ArtistsHelper
  def display_artist(song)
    song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
  end

  def display_all_artists(artists)
    sort = Preference.last.artist_sort_order
    sorted_artists = artists.order(name: sort)

    content_tag(:ul) do
      sorted_artists.collect do |artist|
        concat(content_tag(:li) do
          link_to(artist_songs_path(artist)) do
            artist.name
          end
        end)
      end
    end
  end
end
