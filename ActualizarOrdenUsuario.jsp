<%-- 
    Document   : ActualizarOrden
    Created on : 04-25-2020, 05:02:17 PM
    Author     : Ro-Ma
--%>

<%@page import="com.proyectoprogramacion.objects.LoginObj"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.proyectoprogramacion.objects.OrderObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Estado de Orden</title>
     <script src="js/login.js" charset="utf-8"></script>
    <link rel="stylesheet" href="css/login.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">

    </script>
  
    </head>
    
     <%
         LoginObj CUser = 
                (LoginObj)request.getSession().getAttribute("logged_user");
        List<OrderObj> OList = 
                (List<OrderObj>)request.getSession().getAttribute("ordenesUsuario");
    %>
    <body>
        
        <div class="container">
      <div class="logo">
        <img src="img/logo.png" alt="">
      </div>
            <h2><center>Escribe la orden que deseas actualizar</center></h2>
            <a href="pruebaOrdenUsuario.jsp"><img src="img/undo.png" title="Avanzar" id="fwd"></a>
            
            <label><center>ID Cliente:</center></label>
            <center><%= CUser.getUser() %></center>
        
            
        <form action="ComidaServlet" method="post" class="form_login" >
            <div class="content">
            <label>ID de la Orden</label>
            <select id="OrderID" name="OrderID">
            <%
              if(OList!=null)
              {
                  Iterator<OrderObj> ite = OList.iterator();
                  OrderObj CTemp;
                    
                  while(ite.hasNext())
                  {
                     
                      CTemp = ite.next();
          %>
          
          <%  if(CTemp.getEstado().equals("Activa"))
                  {
          %>
         <option type = "number"name="<%= CTemp.getId() %>" value="<%= CTemp.getId() %>" required autocomplete="off"><%= CTemp.getId() %></option>
    
                 <%
              }
            }
            }
              
          %>
            </select>
          
            <label>Tipo de Estado</label>
            <select id="NuevoEstado" name="NuevoEstado">
                <option name="Activa" value="Activa">Activa</option>
                <option name="Cancelada" value="Anulada">Anulada</option>
                
            </select>
            <input type="hidden" name="loggeduser" value="<%= CUser.getUser() %>" />
            <input type="hidden" name="formid" value="8" />
            <button class="btn" type="submit" onclick="" value="">Actualizar</button><br>
            
            </div>
        </form>
    
    </body>
</html>
