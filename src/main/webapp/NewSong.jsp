<%@page import="es.ulpgc.as.rlp.model.Song"%>
<%@page import="es.ulpgc.as.rlp.Songs"%>
<%@page import="es.ulpgc.as.rlp.model.Playlist"%>
<%@page import="es.ulpgc.as.rlp.controller.UserController"%>
<%@page import="es.ulpgc.as.rlp.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Añade una canción a tu lista!</h1>
        <table style="width:100%">
            <% UserController userController = new UserController((User) session.getAttribute("user"));
            Playlist playlist = userController.getPlaylistWithName(request.getParameter("playlistName"));
            for (Song song : Songs.getSongs(playlist)) {%>
                <tr>
                    <td>
                        <form action="FrontController">
                            <input type="hidden" name="command" value="AddSongCommand">
                            <input type="hidden" name="songId" value="<%=song.getId()%>">
                            <input type="submit" value="<%=song.getName()%>">
                        </form>
                    </td>
                </tr>
            <% } %>
        </table>
    </body>
</html>
