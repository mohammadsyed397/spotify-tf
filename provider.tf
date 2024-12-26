terraform {
  required_providers {
    spotify = {
      source = "conradludgate/spotify"
      version = "0.2.7"
    }
  }
}

provider "spotify"{
  api_key = var.api_key
}
resource "spotify_playlist" "tollywood" {
    name = "tollywood"
  tracks = ["song id"]
}

data "spotify_search_track" "artistname" {
  artist = "artist name"
}
resource "spotify_playlist" "peace" {
    name = "peace"
    tracks = [ data.spotify_search_track.artist.tracks[0].id, 
                data.spotify_search_track.artist.tracks[1].id,
                data.spotify_search_track.artist.tracks[2].id
             ]

  
}