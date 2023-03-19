<%-- 
    Document   : registrarUsr
    Created on : 20 oct. 2022, 20:50:41
    Author     : JorgeEsteban
--%>

<%@page import="conexion.Base"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<% 
    String nombre = request.getParameter("textUsr");
    String contra = request.getParameter("textContra");
    String edad = request.getParameter("textEdad");
    String correo = request.getParameter("textCorreo");
    int e = Integer.parseInt(edad);
    
if(!correo.equals(" ") && !nombre.equals(" ") && !contra.equals(" ") && !edad.equals(" ")){
    Base bd = new Base();
    bd.conectar();
        try {
            String strQry = "insert into Usuarios(Nom_Usr, Correo_Usr, Contra_Usr, Edad_Usr) " 
                        + " values('"+nombre+"', '"+correo+"', '"+contra+"', "+e+");";
            bd.insertar(strQry);
            response.sendRedirect("index.html");
            bd.cierraConexion();
        }
        catch (Exception ex){
            System.out.println(ex);
        }
}
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
