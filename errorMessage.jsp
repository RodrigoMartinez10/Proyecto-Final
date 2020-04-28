<%-- 
    Document   : errorMessage
    Created on : Mar 17, 2020, 8:05:23 PM
    Author     : balbi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Message</title>
    </head>
    <%
        String strMessage = 
                (String) request.getSession().getAttribute("message");
    %>
    <body>
        <h1>Error Message</h1>
        <p><%= strMessage %></p>
        <br><br>
        <a href="index.html">Volver al login</a>
    </body>
</html>
