<%-- 
    Document   : OrdenUsuario
    Created on : 04-23-2020, 08:06:23 AM
    Author     : Ro-Ma
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.proyectoprogramacion.objects.MenuObj"%>
<%@page import="com.proyectoprogramacion.objects.LoginObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Añadir orden</title>
    <script src="js/login.js" charset="utf-8"></script>
    <link rel="stylesheet" href="css/ordenUsuario.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
  </head>
  
   <%
       LoginObj CUser = 
                (LoginObj)request.getSession().getAttribute("logged_user");
         
       List<MenuObj> CList = 
                (List<MenuObj>)request.getSession().getAttribute("menus");
                
                        
         %>
 
  <body>
    <div class="container">
      <div class="logo">
        <img src="img/logo.png" alt="">
      </div>
        <form action="ComidaServlet" class="form_orden" id="cuentaTotal">
        <h2>Haz tu orden</h2>
        <div class="content">
            <label>ID Cliente:</label>
            <%= CUser.getUser() %>
            <input type="hidden" name="loggeduser" value="<%= CUser.getUser() %>" />
            
            <label>Escoge tu plato principal:</label>
            <select class="dd-list" name="list-ppal" id="list-ppal" onchange="getTotalPrincipal()">
                <option name="none" value="none">-</option>
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
         <option name="<%= CTemp.getName() %>" value="<%= CTemp.getName() %>"><%= CTemp.getName() %></option>
                  <%
                    }
                   %>
                 <%
                    }
              }
          %>
            </select>
            
            <label>Escoge tu complemento</label>
            <select class="dd-list" name="list-acomp" id="list-acomp" onchange="getTotalComplemento()">
              <option name="none" value="none" >-</option>
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
         %>                
          <option name="<%= CTemp.getName() %>" value="<%= CTemp.getName() %>"><%= CTemp.getName() %></option>
                 <%
                    }
                   %>
                 <%
                    }
              }
          %>
            </select>
            <label>Escoge tu bebida</label>
            <select class="dd-list" name="list-bebida" id="list-bebida" onchange="getTotalBebida()">
                <option name="none" value="none">-</option>
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
                    {      
         %>                
          <option name="<%= CTemp.getName() %>" value="<%= CTemp.getName() %>"><%= CTemp.getName() %></option>
                 <%
                    }
                   %>
                 <%
                    }
              }
          %>
            </select>
            <label>Total a Cancelar:</label>
            <input type="hidden" name="sendTotal" id="sendTotal"/>
    <div id="showTotal">
        $0.00
    </div>
    <script>
        var principalPrecio=[
        {principal:"-", precio:0.0},  
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
        {principal:"<%= CTemp.getName() %>", precio:<%= CTemp.getPrecio() %>},
        
         <%
                    }
                   %>
                 <%
                    }
            
              }
          %>
    ];
        
        var complementoPrecio=[
            {complemento:"-", precio:0.0},
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
         %>                
        {complemento:"<%= CTemp.getName() %>", precio:<%= CTemp.getPrecio() %>},
        
         <%
                    }
                   %>
                 <%
                    }
              }
          %>
    ];
    
    
        var bebidaPrecio=[
        {bebida:"-", precio:0.0},
        
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
                    {      
         %>                
        {bebida:"<%= CTemp.getName() %>", precio:<%= CTemp.getPrecio() %>},
        
         <%
                    }
                   %>
                 <%
                    }
              }
          %>
    ];        
    </script>
    
    <script src="js/script.js"></script>
            
    <input type="hidden" name="formid" value="6" >        
    <button class="btn" type="submit"onclick="submitTotal()">Añadir orden</button>
        </div>
    </form>
    </div>
  </body>
</html>
