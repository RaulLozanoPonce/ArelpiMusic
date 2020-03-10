package es.ulpgc.as.rlp.model;

public class Song {
    
    private final long id;
    private final String name;
    private final String artist;
    private final String genre;
    private final String path;

    public Song(long id, String name, String artist, String genre, String path) {
        this.id = id;
        this.name = name;
        this.artist = artist;
        this.genre = genre;
        this.path = path;
    }

    public long getId() {
        return id;
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
