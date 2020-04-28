<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.proyectoprogramacion.objects.OrderObj"%>
<%@page import="com.proyectoprogramacion.objects.UserObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/tabla_ordenes.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
   <title>Ordenes - Cafetería Online</title>
  </head>
  
  <%
        List<OrderObj> OList = 
                (List<OrderObj>)request.getSession().getAttribute("ordenesCompletas");
    %>
    
  <body>
      <a href="menu_admin.html"><img src="img/undo.png" class="back"></a>     
        
      <h1><center>Órdenes realizadas en la cafetería</center></h1>
      
      <table class="tablaOrdenes">
            
          <tr>
                        <th>ID Orden</th>
                        <th>Usuario</th>
                        <th>Fecha de Orden</th>
                        <th>Hora de Orden</th>
                        <th>Plato</th>
                        <th>Complemento</th>
                        <th>Bebida</th>
                        <th>Estado</th>
                        <th>Total</th>
                    </tr>
          <%
              if(OList!=null)
              {
                  Iterator<OrderObj> ite = OList.iterator();
                  OrderObj CTemp;
                    
                  while(ite.hasNext())
                  {
                     
                      CTemp = ite.next();
          %>
                <tr>
       
                  <td>  
                  <p><%= CTemp.getId() %></p>
                  </td>
                  <td>  
                  <p><%= CTemp.getUsuario() %></p>
                  </td>
                  
                  <td>  
                  <p style="width: 100px"><%= CTemp.getFecha() %></p>
                  
                  
                  </td>
                  
                  <td>  
                  <p><%= CTemp.getHora() %></p>
                  </td>
                  
                  <td>  
                  <p><%= CTemp.getPlato() %></p>
                  </td>
                  
                  <td>  
                  <p><%= CTemp.getComplemento() %></p>
                  </td>
                  
                  <td>  
                  <p><%= CTemp.getBebida() %></p>
                  </td>
                  
                  <td>  
                  <p><center><%= CTemp.getEstado() %></center></p>
                  </td>
                  
                  <td>  
                  <p>$<%= CTemp.getTotal() %></p>
                  </td>
                  
          <%
                    }
              }
          %>
          
        </table>

      <a href="ActualizarOrden.jsp"><img src="img/right.png" title="Avanzar" id="fwd"></a>
  </body>
</html>
