package es.ulpgc.as.rlp.model;

import java.io.File;

public class Song {
    
    private final String name;
    private final String artist;
    private final String genre;
    private final String path;

    public Song(String name, String artist, String genre, String path) {
        this.name = name;
        this.artist = artist;
        this.genre = genre;
        this.path = path;
    }

    public String getName() {
        return name;
    }

    public String getArtist() {
        return artist;
    }

    public String getGenre() {
        return genre;
    }

    public String getPath() {
        return path;
    }
}
