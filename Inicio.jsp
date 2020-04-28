<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.proyectoprogramacion.objects.MenuObj"%>
<%@page import="com.proyectoprogramacion.objects.UserObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/inicio.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
   <title>Menú Principal - Cafetería Online</title>
  </head>
  
  <%
        List<MenuObj> CList = 
                (List<MenuObj>)request.getSession().getAttribute("menus");
    %>
    
  <body>
      
      <div class="container">
      <div class="logo">
        <img src="img/logo.png" alt="">
      </div>
      <h1><center>Menú Disponible en la cafetería</center></h1>

      <table class="tablaPrincipal" >
          <caption>Platos Disponibles</caption>
                    <tr>
                        <th>Plato</th>
                        <th>Descripción</th>
                        <th></th>
                        <th>Precio</th>
                    </tr>
          <%
              if(CList!=null)
              {
                  Iterator<MenuObj> ite = CList.iterator();
                  MenuObj CTemp;
                    
                  while(ite.hasNext())
                  {
                     
                      CTemp = ite.next();
          %>
                
                      <%if(CTemp.getType().equals("principal"))
                    {      
         %>       
                    
                   <tr>
                  <td>  
                  <p><%= CTemp.getName() %></p>
                  </td>
                  <td>  
                  <p><%= CTemp.getDescripcion() %></p>
                  </td>
                  
                 <td><img src="img/menu/<%= CTemp.getImagen() %>" width="140" height="130" /></td>
                  <td id="tdPrecio">
                  <p>$<%= CTemp.getPrecio() %></p>
                  </td>
                  </tr>
                  <%
                    }
                   %>
                
          <%
                    }
              }
          %>
          
        </table>
          
          <br><br><br><br><br><br><br><br>
      <table class="tablaComplemento">
          <caption>Complementos Disponibles</caption>
      
            <tr>
                        <th>Complemento</th>
                        <th>Descripción</th>
                        <th></th>
                        <th>Precio</th>
                    </tr>
          <%
              if(CList!=null)
              {
                  Iterator<MenuObj> ite = CList.iterator();
                  MenuObj CTemp;
                    
                  while(ite.hasNext())
                  {
                     
                      CTemp = ite.next();
          %>
                <tr>
                      <%if(CTemp.getType().equals("complemento"))
                    {      
         %>                
                  <td>  
                  <p><%= CTemp.getName() %></p>
                  </td>
                  <td>  
                  <p><%= CTemp.getDescripcion() %></p>
                  </td>
                  
                 <td><img src="img/menu/<%= CTemp.getImagen() %>" width="130" height="130" /></td>
                  <td id="tdPrecio">
                  <p>$<%= CTemp.getPrecio() %></p>
                  </td>
                  <%
                    }
                   %>
                </tr>
          <%
                    }
              }
          %>
          
        </table>
          
      
          <br><br><br><br><br><br><br><br>         
      <table class="tablaBebidas">
      <caption>Bebidas Disponibles</caption>
            
                    <tr>
                        <th>Bebida</th>
                        <th>Descripción</th>
                        <th></th>
                        <th>Precio</th>
                    </tr>
          <%
              if(CList!=null)
              {
                  Iterator<MenuObj> ite = CList.iterator();
                  MenuObj CTemp;
                    
                  while(ite.hasNext())
                  {
                     
                      CTemp = ite.next();
          %>
                <tr>
                  <%if(CTemp.getType().equals("bebida"))
                    {      
         %>                
                  <td>  
                  <p><%= CTemp.getName() %></p>
                  </td>
                  <td>  
                  <p><%= CTemp.getDescripcion() %></p>
                  </td>
                  
                 <td><img src="img/menu/<%= CTemp.getImagen() %>" width="130" height="130" /></td>
                  <td id="tdPrecio">
                      <p>$<%= CTemp.getPrecio() %></p>
                  </td>
                  <%
                    }
                   %>
                </tr>
          <%
                    }
              }
          %>
          
        </table>
          <div class="sticky">
              <a href="menu_user.html"><img src="img/undo.png" title="Regresar" id="fwd"></a>
          </div>
          
   </body>
</html>
