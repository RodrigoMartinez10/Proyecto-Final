<%-- 
    Document   : ActualizarOrden
    Created on : 04-25-2020, 05:02:17 PM
    Author     : Ro-Ma
--%>

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
    <body>
        
        <div class="container">
      <div class="logo">
        <img src="img/logo.png" alt="">
      </div>
            <h2><center>Escribe la orden que deseas actualizar</center></h2>
        
            <a href="pruebaOrden.jsp"><img src="img/undo.png" class="back"></a>     
        <form action="ComidaServlet" method="post" class="form_login" >
            <div class="content">
            <label>ID de la Orden</label>
            <input type="number" name="OrderID" required autocomplete="off">
            <label>Tipo de Estado</label>
            <select id="NuevoEstado" name="NuevoEstado">
                <option name="Activa" value="Activa">Activa</option>
                <option name="Pagada" value="Pagada">Pagada</option>
                <option name="Anulada" value="Anulada">Anulada</option>
                
            </select>
            <input type="hidden" name="formid" value="7" />
            <button class="btn" type="submit" onclick="" value="">Actualizar</button><br>
            
            </div>
        </form>
    
    </body>
</html>
