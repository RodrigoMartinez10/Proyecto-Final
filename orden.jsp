<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.proyectoprogramacion.objects.MenuObj"%>
<%@page import="com.proyectoprogramacion.objects.UserObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/orden.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
    <title>Admin - Cafetería Online</title>
  </head>
  
   <%
        List<MenuObj> CList = 
                (List<MenuObj>)request.getSession().getAttribute("menuCompleto");
    %>
 
  <body>
     <img src="img/logo.png" alt="">
    <span class="main-title">Cafeteria online-Admin page</span><br><br><br>
    <span class="message">Agrega los platos que estarán disponibles para el menú del día</span>
    
    <div class="colores">
    <label class="minititulo">Disponible</label> 
    <div class="verde">
    <img src="img/verde.jpg">
    </div>
    <div class="blanco">
    <label class="minititulo2"> No Disponible</label>
    <img src="img/blanco.png">
    </div>
    </div>
    
    <div class="contendedor">
    <div class="principal">
      <span class="titulo">Plato Principal</span>
      <ul class="lista1" id="lista1">
        
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
                        if(CTemp.getDisponibilidad()==1)
                        {
         %>                     
           <li style="background-color: #7bed9f" id="<%= CTemp.getName()%>" onclick="moverElemento(this.id)" name="plato"><%= CTemp.getName() %></li>
            <%
                    }

                     if(CTemp.getDisponibilidad()==0)
                        {
         %>                     
           <li id="<%= CTemp.getName()%>" onclick="moverElemento(this.id)" name="plato"><%= CTemp.getName() %></li>
            <%
                    }
                   }
                  }
                }
                   %>
       </ul>
    </div>
    <div class="seleccion1">
      <ul class="ls1" id="ls1">

      </ul>
    </div>
    <div class="acompañamiento">
      <span class="titulo">Acompañamientos</span>
      <ul class="lista2" id="lista2">
          
       <%
              if(CList!=null)
              {
                  Iterator<MenuObj> ite = CList.iterator();
                  MenuObj CTemp;
                    
                  while(ite.hasNext())
                  {

                      CTemp = ite.next();
          %>
                      <%if(CTemp.getType().equals("complemento"))
                    {      
%>      <%          if(CTemp.getDisponibilidad()==1)
                        {
         %>                     
           <li style="background-color: #7bed9f" id="<%= CTemp.getName()%>" onclick="moverElemento(this.id)" name="plato"><%= CTemp.getName() %></li>
            <%
                    }

                     if(CTemp.getDisponibilidad()==0)
                        {
         %>                     
           <li id="<%= CTemp.getName()%>" onclick="moverElemento(this.id)" name="plato"><%= CTemp.getName() %></li>
            <%
                    }
                    }
                  }
                }
                   %>   
      </ul>
    </div>
    <div class="seleccion2">
      <ul id="ls2" class="ls2" name="ls2">

      </ul>
    </div>
    <div class="bebida">
      <span class="titulo">Bebidas</span>
      <ul class="lista3" id="lista3">
        <%
              if(CList!=null)
              {
                  Iterator<MenuObj> ite = CList.iterator();
                  MenuObj CTemp;
                    
                  while(ite.hasNext())
                  {

                      CTemp = ite.next();
          %>
                      <%if(CTemp.getType().equals("bebida"))
                    {if(CTemp.getDisponibilidad()==1)
                        {
         %>                     
           <li style="background-color: #7bed9f" id="<%= CTemp.getName()%>" onclick="moverElemento(this.id)" name="plato"><%= CTemp.getName() %></li>
            <%
                    }

                     if(CTemp.getDisponibilidad()==0)
                        {
         %>                     
           <li id="<%= CTemp.getName()%>" onclick="moverElemento(this.id)" name="plato"><%= CTemp.getName() %></li>
            <%
                    }
                    }
                  }
                }
                   %>
      </ul>
    </div>
    <div class="seleccion3">
      <ul id="ls3" class="ls3" name="ls3">
          
      </ul>
    </div>
      <form action="ComidaServlet" method= "post" class="SubmitDB" id="SubmitPlatos">
      <input type="hidden" name="formid" value="3" >
      
      <input type="hidden" name="PlatosSeleccionados" id="PlatosSeleccionados" value="" >
      <input type="submit" id="Submit" onclick="procesarPlatos()" value="">
    </form>
  </div>
  <script src="js/orden.js" charset="utf-8"></script>
      
  </body>
</html>
