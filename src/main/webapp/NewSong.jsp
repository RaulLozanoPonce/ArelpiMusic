<%@page import="es.ulpgc.as.rlp.model.Song"%>
<%@page import="es.ulpgc.as.rlp.Songs"%>
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
            <tr>
                <th>Nombre Canción</th>
                <th>Artista/s</th>
                <th>Añadir Canción</th>
            </tr>
            <jsp:useBean id="playlist" type="es.ulpgc.as.rlp.model.Playlist" scope="session" />
            <% for (int i = 0; i < Songs.getSongs(playlist).size(); i++) { %>
                <% Song song = Songs.getSongs(playlist).get(i); %>
                <tr>
                    <td><%=song.getName()%></td>
                    <td><%=song.getArtist()%></td>
                    <td>
                        <form action="FrontController">
                            <input type="hidden" name="command" value="AddSongCommand">
                            <input type="hidden" name="songName" value="<%=song.getName()%>">
                            <input type="submit" value="Añadir">
                        </form>
                    </td>
                </tr>
            <% } %>
        </table>
    </body>
</html>
