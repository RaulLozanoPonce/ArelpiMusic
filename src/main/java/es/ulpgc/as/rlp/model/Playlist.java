package es.ulpgc.as.rlp.model;

import java.util.ArrayList;
import java.util.List;

public class Playlist {
    
    private final String name;
    private final List<Song> songs;

    public Playlist(String name) {
        this.name = name;
        this.songs = new ArrayList<>();
    }

    public String getName() {
        return name;
    }

    public List<Song> getSongs() {
        return songs;
    }
}
