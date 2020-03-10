package es.ulpgc.as.rlp.model;

import java.util.ArrayList;
import java.util.List;

public class User {
    
    private String name;
    private String email;
    private List<Playlist> playlists;

    public User(String name, String email) {
        this.name = name;
        this.email = email;
        this.playlists = new ArrayList<>();
    }

    public String getName() {
        return name;
    }

    public List<Playlist> getPlaylists() {
        return playlists;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    
}
