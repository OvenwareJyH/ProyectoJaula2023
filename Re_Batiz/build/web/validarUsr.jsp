<%-- 
    Document   : validarUsr
    Created on : 20 oct. 2022, 20:47:30
    Author     : JorgeEsteban
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Base"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String correo = request.getParameter("textCorreo");
    String contra = request.getParameter("textContra");
    out.print(correo);
    out.print(contra);
    if(correo==null){
        correo="0";
    }
    else{
        if(correo.equals("")){
            correo="0";
        }
    }
    if(contra==null){
        contra="0";
    }
    else{
        if(contra.equals("")){
            contra="0";
        }
    }
    
if (!correo.equals("") && !contra.equals("")){
        Base bd = new Base();
        bd.conectar();
        String strQry;
        
        strQry = "select* from Usuarios where Correo_Usr='"+correo+"' and Contra_Usr = '"+contra+"';";
        ResultSet rsValidaUsr = bd.consulta(strQry);
        out.print("checar resultado de la base " + rsValidaUsr);
            
        if(rsValidaUsr.next()){
            HttpSession sesion = (HttpSession) request.getSession();
            
            int id = rsValidaUsr.getInt("ID_Usr");
            String nombre = rsValidaUsr.getString("Nom_Usr");
            sesion.setAttribute("Id", id);
            sesion.setAttribute("nombreUsr", nombre);                
            response.sendRedirect("principal.jsp");
        }
}
else
        response.sendRedirect("index.html");
    
    %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
