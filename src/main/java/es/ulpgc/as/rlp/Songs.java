package es.ulpgc.as.rlp;

import es.ulpgc.as.rlp.model.Playlist;
import es.ulpgc.as.rlp.model.Song;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Songs {
    
    private static List<Song> songList;
    
    static {
        songList = new ArrayList<>();
        songList.add(new Song(1, "Boulevard Of Broken Dreams", "Green Day", "Rock", "song.mp3"));
    }
    
    public static List<Song> getSongs(Playlist playlist) {
        return songList;
    }

    public static Song getSongByName(String name) {
        return songList.stream().filter(song -> song.getName().equals(name)).collect(Collectors.toList()).get(0);
    }
}
