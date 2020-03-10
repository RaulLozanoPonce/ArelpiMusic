<%@page import="es.ulpgc.as.rlp.model.Playlist"%>
<%@page import="es.ulpgc.as.rlp.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ArelpiMusic</title>
    </head>
    <body>
        <h1>ArelpiMusic</h1>
        <h3>Bienvenidos a ArelpiMusic, una aplicación Web en la que podrás crear 
            listas de reproducción de música y compartila con tus amigos</h3>
        
        <form action="NewPlaylist.jsp">
            <input type="submit" value="Nueva Playlist">
        </form>
        <form action="Support.jsp">
            <input type="submit" value="Contáctanos">
        </form>
        <h4>Listas de reproducción:</h4>
        <table style="width:100%">
            <tr>
                <th>Nombre Playlist</th>
                <th>Número de Canciones</th>
                <th>Borrar Playlist</th>
            </tr>
            <% User user = (User) session.getAttribute("user");
            for (int i = 0; i < user.getPlaylists().size(); i++) {
                Playlist playlist = user.getPlaylists().get(i); %>
                <tr>
                    <td>
                        <form action="PlaylistView.jsp">
                            <input type="hidden" name="playlistName" value="<%=playlist.getName()%>">
                            <input type="submit" value="<%=playlist.getName()%>">
                        </form>
                    </td>
                    <td><%= playlist.getSongs().size() %></td>
                    <td>
                        <form action="FrontController">
                            <input type="hidden" name="command" value="DeletePlaylistCommand">
                            <input type="hidden" name="playlistName" value="<%=playlist.getName()%>">
                            <input type="submit" value="Borrar">
                        </form>
                    </td>
                </tr>
            <% } %>
        </table>
    </body>
</html>
