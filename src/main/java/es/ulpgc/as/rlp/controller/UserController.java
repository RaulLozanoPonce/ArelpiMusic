package es.ulpgc.as.rlp.controller;

import es.ulpgc.as.rlp.model.Playlist;
import es.ulpgc.as.rlp.model.User;
import java.util.Optional;

public class UserController {
    
    private User user;

    public UserController(User user) {
        this.user = user;
    }
    
    public Playlist getPlaylistWithName(String name) {
        Optional<Playlist> playlistToReturn = user.getPlaylists().stream()
                .filter(playlist -> playlist.getName().equals(name))
                .findFirst();
        return playlistToReturn.isPresent() ? playlistToReturn.get() : null;
    }
}
