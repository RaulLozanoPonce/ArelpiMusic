package es.ulpgc.as.rlp.controller.command;

import es.ulpgc.as.rlp.controller.UserInitializerDispatcher;
import es.ulpgc.as.rlp.model.Playlist;
import es.ulpgc.as.rlp.model.User;
import javax.servlet.http.HttpSession;

public class DeletePlaylistCommand extends FrontCommand {

    @Override
    public void process() {
        UserInitializerDispatcher.initSession(request);
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Playlist playlistToRemove = null;
        for (Playlist playlist : user.getPlaylists()) {
            if(playlist.getName().equals(request.getParameter("playlistName"))) {
                playlistToRemove = playlist;
                break;
            }
        }
        
        if(playlistToRemove != null) user.getPlaylists().remove(playlistToRemove);
        session.setAttribute("user", user);
        
        forward("/ArelpiMusic.jsp");
    }
}
