<%-- 
    Document   : misPosts
    Created on : 8 nov. 2022, 21:41:56
    Author     : JorgeEsteban
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
        <title>Mis Posts | Re-Bátiz</title>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
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
                            <a class="nav-link active text-right fs-4" aria-current="page" href="principal.jsp"  style="color: white; text-decoration: underline; font-size-adjust: 20;" >Principal</a>
                        </li>
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
        <!-- conexión a la BD -->
        <br><br><br><br><br><br><br>
        <div class="container justify-content-center" style="background-color: #F8F0F0; border-radius: 15px; width: 90%; align-content: center">
            <div class="row justify-content-center">
                <br><br><br><br><br><br>
                <div class="col col-11 align-self-center fs-1" align="center" style="background-color: #FFFFFF"><b>Mis Posts</b></div>
            </div>
        <%
            try{
                Base bd = new Base();
                bd.conectar();
                
                String strQry = "select distinct p.*, r.ID_Usr,Nom_Usr from Posts p, Post_Usuario q, Usuarios r where p.ID_Posts = q.ID_Posts and q.ID_Usr = r.ID_Usr and r.ID_Usr = '"+Id+"' ;";
                

                ResultSet rs = null;
                rs = bd.consulta(strQry);
                
                
                
                while (rs.next()){
        %>
            <div class="row justify-content-center"  align="center">
                <br>
                <div class="col col-6 align-self-center fs-4 fsw-bold" style="background-color: #FFFFFF; " align="left"><br><b><%=rs.getString(2)%></b></div>
                <div class="col col-5 align-self-center fs-4 fw-light" style="background-color: #FFFFFF; " align="right"><br><%=rs.getString(4)%></div>
                <div class="col col-11 align-self-center" style="background-color: #FFFFFF" align="justify">
                    <br><%=rs.getString(3)%><br>
                    <img src="img/mensajito.png" align="right" width="50px"/>
                </div>
            </div>
            <br>
        <%
                }
                bd.cierraConexion();
            }           
            catch(Exception ex){}
        %>
        <br><br>
        </div>
    </body>
</html>
