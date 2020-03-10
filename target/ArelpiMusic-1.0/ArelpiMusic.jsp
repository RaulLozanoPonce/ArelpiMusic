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
        <jsp:useBean id="user" type="es.ulpgc.as.rlp.model.User" scope="session" />
        <% for (int i = 0; i < user.getPlaylists().size(); i++) { %>
            <p>- <%= user.getPlaylists().get(i).getName() %>
        <% } %>
    </body>
</html>
