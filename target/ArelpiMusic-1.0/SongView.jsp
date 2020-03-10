<%@page import="es.ulpgc.as.rlp.model.Song"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Nombre de la canción: <%=request.getParameter("songName")%></h1>
    </body>
</html>
