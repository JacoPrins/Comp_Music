library(tidyverse)
library(spotifyr)

house <- get_playlist_audio_features("", "3Bjr19sZK5leO42HHU5Uwo")

daily_mix <- get_playlist_audio_features("37i9dQZF1E36Q4Ps2lGNUz")

house_energy <- house$energy
playlist_feature<- get_playlist_tracks("", "3Bjr19sZK5leO42HHU5Uwo")


ggplot(house, aes(x= loudness, y=valence, color=acousticness)) +
  ggtitle("Analysis: valence - loudness - acousticness") +
  geom_point()+
   ylim(0,1) +
  scale_fill_brewer(palette = "Set2")

ggplot(house, aes(x= energy, y=valence, color=as.factor(time_signature))) +
  ggtitle("Analysis: Energy - Loudness - Time signature") +
  geom_point()+
  xlim(0,1) + ylim(0,1) +
  xlab("Energy") + 
  ylab("Valence") +
  labs(col="Time signature")

ggplot(house, aes(x=energy)) +
  ggtitle("Energy distribution over all the songs")+
  xlab("Energy") + 
  ylab("Count") +
  geom_histogram(binwidth = 0.1, color="white", fill="aquamarine3") 

house%>%
  mutate(mode=as.factor(mode)) %>%
ggplot(aes(x=key, fill=mode)) +
  ggtitle("Distribution of key signatures")+
  xlab("Key") + 
  ylab("Count") +
  geom_histogram(binwidth = 1, color="white")

ggplot(house, aes(x=track.album.release_date)) + 
  geom_histogram(bins=10)
  

