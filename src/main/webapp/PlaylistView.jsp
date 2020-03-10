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
            <jsp:useBean id="playlist" type="es.ulpgc.as.rlp.model.Playlist" scope="session" />
            <% for (int i = 0; i < playlist.getSongs().size(); i++) { %>
                <% Song song = playlist.getSongs().get(i); %>
                <tr>
                    <td>
                        <form action="SongView.jsp">
                            <input type="hidden" name="songName" value="<%=song.getName()%>">
                            <input type="submit" value="Reproducir">
                        </form>
                    </td>
                    <td><%=song.getName()%></td>
                    <td><%=song.getArtist()%></td>
                    <td>
                        <form action="FrontController">
                            <input type="hidden" name="command" value="DeleteSongCommand">
                            <input type="hidden" name="songName" value="<%=song.getName()%>">
                            <input type="submit" name="songName" value="Borrar">
                        </form>
                    </td>
                </tr>
            <% } %>
        </table>
    </body>
</html>
