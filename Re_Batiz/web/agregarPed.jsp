<%-- 
    Document   : agregarPed
    Created on : Nov 24, 2022, 8:10:16 AM
    Author     : alumno
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Base"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    HttpSession sesion = (HttpSession) request.getSession();
    String nombre = (String) sesion.getAttribute("nombreUsr");
    int Id = (int) (sesion.getAttribute("Id") == null ? 0 : sesion.getAttribute("Id"));
    
    
        if (Id<1)
            response.sendRedirect("index.html");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
        <title>Ehe | Re-Bátiz</title>
        <link href="https://fonts.googleapis.com/css?family=Secular+One|Open+Sans|Ruda" rel="stylesheet" type="text/css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    </head>
    <body style="background-color: #FFE8D6;">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        
        <!-- Inicio navbar-->
        <nav class="navbar navbar-expand-lg fixed-top" id="nya" style="background-color: #9F4307">
            
            <!-- Título del proyecto -->
            <div class="container-fluid">
                <a class="navbar-brand" style="color: #FF9153; font-family: Secular One; font-size: 42px">Re-Bátiz</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                <!-- contenido a la derecha -->
                <div class="collapse navbar-collapse align-items-center" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0"align="right">
                        <li class="nav-item">
                            <a class="nav-link active text-right fs-4" aria-current="page" href="comunidad.jsp" style="color: white; text-decoration: underline; font-size-adjust:  20;">Comunidad</a>
                            <blockquote></blockquote>
                        </li>
                        <li class="nav-item dropdown text-right">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="img/perfilito.png" height="40px" width="40px" />
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><a class="dropdown-item" href="miCuenta.jsp">Mi Cuenta</a></li>
                                <li><a class="dropdown-item" href="misPosts.jsp">Mis Posts</a></li>
                                <li><a class="dropdown-item" href="misPedidos.jsp">Mis Pedidos</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="salir.jsp" style="color: red">Cerrar sesión</a></li>
                            </ul>
                        </li>
                   </ul>
                </div>
            </div>
        </nav><!-- fin navbar -->
        <br><br><br><br><br>
        <div align="center">
            <img src="img/gato.jpg" width="500px" height="500px"/>
            <p>Próximamente...</p>
        </div>
