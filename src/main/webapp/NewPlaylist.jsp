<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Playlist</title>
    </head>
    <body>
        <h1>Nueva Playlist</h1>
        <form action="FrontController">
            <input type="hidden" name="command" value="NewPlaylistCommand">
            Nombre de la Playlist:
            <input type="text" name="playlistName"><br>
            <input type="submit" value="Crear Playlist">
        </form>
    </body>
</html>
