<%-- 
    Document   : salir
    Created on : 7 nov. 2022, 20:34:54
    Author     : JorgeEsteban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    HttpSession sesion = (HttpSession) request.getSession();
    sesion.invalidate();
    response.sendRedirect("index.html");
%> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
