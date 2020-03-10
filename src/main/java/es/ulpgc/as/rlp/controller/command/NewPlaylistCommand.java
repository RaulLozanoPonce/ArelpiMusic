package es.ulpgc.as.rlp.controller.command;

import es.ulpgc.as.rlp.controller.UserInitializerDispatcher;
import es.ulpgc.as.rlp.model.Playlist;
import es.ulpgc.as.rlp.model.User;
import javax.servlet.http.HttpSession;

public class NewPlaylistCommand extends FrontCommand {

    @Override
    public void process() {
        UserInitializerDispatcher.initSession(request);
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Playlist playlist = new Playlist(request.getParameter("playlistName"));
        user.getPlaylists().add(playlist);
        session.setAttribute("user", user);
        
        forward("/ArelpiMusic.jsp");
    }
}
