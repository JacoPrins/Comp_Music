library(tidyverse)
library(spotifyr)
library(htmltools)
library(compmus)
library(plotly)
# get the audio features
house <- get_playlist_audio_features("", "3Bjr19sZK5leO42HHU5Uwo")

ggplot(house, aes(x=instrumentalness)) +
  ggtitle("Energy distribution over all the songs")+
  xlab("Energy") + 
  ylab("Count") +
  geom_histogram(binwidth = 0.1, color="white", fill="aquamarine3") 

ggplot(house, aes(x= energy, y=valence, color=as.factor(time_signature))) +
  ggtitle("Analysis: Energy - Loudness - Time signature") +
  geom_point()+
  xlim(0,1) + ylim(0,1) +
  xlab("Energy") + 
  ylab("Valence") +
  labs(col="Time signature")

house['album_date'] <- with(house, get_artist_audio_features(house['track.album.id']))
  