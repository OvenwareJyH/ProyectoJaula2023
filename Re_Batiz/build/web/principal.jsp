<%-- 
    Document   : principal
    Created on : 20 oct. 2022, 23:58:41
    Author     : JorgeEsteban
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Base"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    HttpSession sesion = (HttpSession) request.getSession();
    String nombre = (String) sesion.getAttribute("nombreUsr");
    int Id = (int) (sesion.getAttribute("Id") == null ? 0 : sesion.getAttribute("Id"));
    int IDProd = 0;
    
        if (Id<1)
            response.sendRedirect("index.html");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
        <title>Página Principal | Re-Bátiz</title>
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
        <div class="container-xxl" align="center">
            <nav>
                <ul class="nav">
                    <li class="nav-item">
                        <a class="nav-link disabled" style="background-color: #EFD6C2; color: black;">Mostrar por</a>
                    </li>
                    <li class="nav-item dropdown text-right">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"></a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="principal.jsp">Más recientes</a></li>
                            <li><a class="dropdown-item" href="principalMateria.jsp">Materia</a></li>
                            <li><a class="dropdown-item" href="principalPrecio.jsp">Precio</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <br><br>
            <div class="row" style="width: 100%">
            <% 
                try{
                    Base bd = new Base();
                    bd.conectar();
                    
                    String strQry = "select distinct p.*, q.*, r.Nom_Vend from Producto p, Producto_Vendedores q, Vendedores r where p.ID_Prod = q.ID_Prod and q.ID_Usr = r.ID_Usr order by Fecha_Prod;";
                    ResultSet rs= null;
                    rs= bd.consulta(strQry);
                    
                    if(!rs.next()){
            %>
            <img src="img/oups.gif" style="width: 200px; align-items: center" class="rounded mx-auto d-block" height="200px" align="center">
            <p class="fs-3 fw-light fst-italic">Parece que no hay nada...</p>
            <%
                }
                    while (rs.next()){
                        IDProd = Integer.parseInt(rs.getString(1));
                        
                    %>
                    <div class="col-sm-4 " style=" float: left">
                        <table class="table table-borderless w-auto" style="background-color: #F8F0F0; border-radius: 15px; ">
                            <tr style="text-align: center">
                                <td colspan="2" class="fs-3 fsw-bold"><a type="button" class="btn fs-3 fsw-bold"  href="desplegarProd.jsp?IDProd=<%=IDProd%>" style=""><%=rs.getString(2)%></a></td>
                            </tr>
                            <tr>
                                <td class="fs-5" style="text-align: center">$<%=rs.getString(4)%></td>
                                <td rowspan="3">
                    <%
                        if(rs.getString(7) != null){
                    %> 
                                <img src="productos/<%=rs.getString(7)%>" width="170px" height="170px">
                    <%
                        }
                        if(rs.getString(7)==null){
                    %>
                                <img src="img/image.png" alt="Imagen no encontrada :/" width="170px">
                    <%
                        }
                    %>
                                </td>
                            </tr>
                            <tr>
                                <td class="fs-5 fw-light">#<%=rs.getString(5)%></td>
                            </tr>
                            <tr>
                                <td class="fs-5"><%=rs.getString(3)%></td>
                            </tr>
                            <tr><br></tr>
                        </table>
                    </div>
                    <%
                    }
                    rs.next();
                    bd.cierraConexion();
                }
                catch (Exception e){
                    
                }
                
            %>
            </div>
        </div>
            <nav class="navbar fixed-bottom bg-body-tertiary"  align="right">
                <div class="container-fluid justify-content-end">
                    <a class="navbar-brand" href="crearProd.jsp" align="right" onh ><img src="img/plusito.png" width="45px" height="45px" style="background-color: #FF9153; "></a>   
                </div>
            </nav>
    </body>
</html>
