<%@page import="es.ulpgc.as.rlp.controller.UserController"%>
<%@page import="es.ulpgc.as.rlp.model.Playlist"%>
<%@page import="es.ulpgc.as.rlp.model.User"%>
<%@page import="es.ulpgc.as.rlp.model.Song"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ArelpiMusic</title>
    </head>
    <body>
        <h1>ArelpiMusic</h1>
        <form action="NewSong.jsp">
            <input type="hidden" value="<%=request.getParameter("playlistName")%>">
            <input type="submit" value="Añadir Canción">
        </form>
        <h4><%=request.getParameter("playlistName")%>:</h4>
        <table style="width:100%">
            <tr>
                <th>Reproducir</th>
                <th>Nombre Canción</th>
                <th>Artista/s</th>
                <th>Borrar Canción</th>
            </tr>
            <% UserController userController = new UserController((User) session.getAttribute("user"));
            Playlist playlist = userController.getPlaylistWithName(request.getParameter("playlistName"));
            for (int i = 0; i < playlist.getSongs().size(); i++) {
                Song song = playlist.getSongs().get(i); %>
                <tr>
                    <td>
                        <form action="SongView.jsp">
                            <input type="hidden" name="songId" value="<%=song.getId()%>">
                            <input type="submit" value="Reproducir">
                        </form>
                    </td>
                    <td><%=song.getName()%></td>
                    <td><%=song.getArtist()%></td>
                    <td><%=song.getGenre()%></td>
                    <td>
                        <form action="FrontController">
                            <input type="hidden" name="command" value="DeleteSongCommand">
                            <input type="hidden" name="playlistName" value="<%=song.getId()%>">
                            <input type="submit" value="Borrar">
                        </form>
                    </td>
                </tr>
            <% } %>
        </table>
    </body>
</html>
