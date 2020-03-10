package es.ulpgc.as.rlp.controller.command;

import es.ulpgc.as.rlp.Songs;
import es.ulpgc.as.rlp.controller.UserInitializerDispatcher;
import es.ulpgc.as.rlp.model.Playlist;
import es.ulpgc.as.rlp.model.Song;
import es.ulpgc.as.rlp.model.User;
import javax.servlet.http.HttpSession;

public class AddSongCommand extends FrontCommand {

    @Override
    public void process() {
        UserInitializerDispatcher.initSession(request);
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        Song song = Songs.getSongByName(request.getParameter("songName"));
        Playlist playlist = request.getParameter("playlistName");
        playlist.getSongs().add(song);
        session.setAttribute("user", user);
        
        forward("/NewSong.jsp");
    }
}
