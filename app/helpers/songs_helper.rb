module SongsHelper
  def display_all_songs(songs)
    sort = Preference.last.song_sort_order
    sorted_songs = songs.order(title: sort)

    content_tag(:ul) do
      sorted_songs.collect do |song|
        concat(content_tag(:li) do
          display_artist(song) + " - " + link_to(song_path(song)) do
            song.title
          end
        end)
      end
    end
  end
end
