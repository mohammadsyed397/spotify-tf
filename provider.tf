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
  tracks = ["7BNQPLWREFSxfyvmVZNW4h"]
}

data "spotify_search_track" "A_R_Rahman" {
  artist = "A.R.Rahman"
}
resource "spotify_playlist" "peace" {
    name = "peace"
    tracks = [ data.spotify_search_track.A_R_Rahman.tracks[0].id, 
                data.spotify_search_track.A_R_Rahman.tracks[1].id,
                data.spotify_search_track.A_R_Rahman.tracks[2].id
             ]

  
}