package com.proyectoprogramacion.servlets;

import com.proyectoprogramacion.logic.MenuLogic;
import com.proyectoprogramacion.objects.MenuObj;
import com.proyectoprogramacion.objects.OrderObj;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ComidaServlet", urlPatterns = {"/ComidaServlet"})
public class ComidaServlet extends HttpServlet 
{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       MenuLogic CMenuLogic = new MenuLogic("jdbc:mysql://localhost/personalfinancedb?"
                + "user=root&password=12345&"
                + "autoReconnect=true&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true");
        
        
       String strFormId = request.getParameter("formid");
        
       
        //seccion de register normal user
        if(strFormId.equals("3"))
        {
       String strSeleccion = request.getParameter("PlatosSeleccionados");
        
        //System.out.println("ls2: " + strSeleccion);
        
        String[] CLista1 = strSeleccion.split(","); // no va
        
       CMenuLogic.actualizarComida(CLista1);
       
       List<MenuObj> CList = CMenuLogic.getMenu();
                
       request.getSession().setAttribute("menuCompleto", CList);
                
       request.getRequestDispatcher("menu_admin.html")
                       .forward(request, response);
        
    }
       else if(strFormId.equals("4"))
        {
       String strSeleccion = request.getParameter("PlatosSeleccionados");
        
        //System.out.println("ls2: " + strSeleccion);
        
        String[] CLista1 = strSeleccion.split(","); // no va
        
       CMenuLogic.quitarComida(CLista1);
       
       List<MenuObj> CList = CMenuLogic.getMenu();
                
       request.getSession().setAttribute("menuCompleto", CList);
        
       request.getRequestDispatcher("menu_admin.html")
                       .forward(request, response);
        
    }
        
       else if(strFormId.equals("5"))
        {
            
            String strName = request.getParameter("plato");
            String strPrecio = request.getParameter("precio");
            String strType = request.getParameter("tipo");
            String strDescripcion = request.getParameter("descripcion");
            String strImagen = request.getParameter("imagen");
            double dblPrecio = Double.parseDouble(strPrecio);
            boolean hasFailed = 
                    CMenuLogic.insertMenu(strName, dblPrecio, 0, strType , strDescripcion, strImagen);
            
            List<MenuObj> CList = CMenuLogic.getMenu();
                
            request.getSession().setAttribute("menuCompleto", CList);
       
            request.getRequestDispatcher("menu_admin.html")
                   .forward(request, response);
            }
        else if(strFormId.equals("6"))
        {
            
            String strUser = request.getParameter("loggeduser");
            String strPlato = request.getParameter("list-ppal");
            String strComplemento = request.getParameter("list-acomp");
            String strBebida = request.getParameter("list-bebida");
            String strTotal = request.getParameter("sendTotal");
            double dblTotal = Double.parseDouble(strTotal);
            
            
            Date ahora = new Date();
            SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat formatoTiempo = new SimpleDateFormat("HH:mm:ss");
            String fechaFormatoTiempo = formatoTiempo.format(ahora);
            String fechaFormateada = formatoFecha.format(ahora);
        
            boolean hasFailed = 
                    CMenuLogic.insertOrder(strUser, fechaFormateada, fechaFormatoTiempo, strPlato, strComplemento , strBebida, dblTotal);
            List<OrderObj> OList = CMenuLogic.getUserOrders(strUser);         
            request.getSession().setAttribute("ordenesUsuario", OList);
            
            request.getRequestDispatcher("menu_user.html")
                   .forward(request, response);
            }
         else if(strFormId.equals("7"))
        {
       String strId = request.getParameter("OrderID");
       String strEstado = request.getParameter("NuevoEstado");
        
       
       CMenuLogic.actualizarOrden(strId, strEstado);
       
       List<OrderObj> OList = CMenuLogic.getOrders();         
       request.getSession().setAttribute("ordenesCompletas", OList);
           
        
       request.getRequestDispatcher("pruebaOrden.jsp")
                       .forward(request, response);
        
    }
        
        else if(strFormId.equals("8"))
        {
       String strId = request.getParameter("OrderID");
       String strEstado = request.getParameter("NuevoEstado");
       String strUser = request.getParameter("loggeduser");
       
       CMenuLogic.actualizarOrden(strId, strEstado);
       
       List<OrderObj> OList = CMenuLogic.getUserOrders(strUser);         
       request.getSession().setAttribute("ordenesUsuario", OList);
           
        
       request.getRequestDispatcher("pruebaOrdenUsuario.jsp")
                       .forward(request, response);
        
    }
        
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
