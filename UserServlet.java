package com.proyectoprogramacion.servlets;


import com.proyectoprogramacion.enums.UserType;
import com.proyectoprogramacion.logic.UserLogic;
import com.proyectoprogramacion.logic.MenuLogic;
import com.proyectoprogramacion.objects.LoginObj;
import com.proyectoprogramacion.objects.MenuObj;
import com.proyectoprogramacion.objects.OrderObj;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet(name = "UserServlet", urlPatterns = {"/UserServlet"})
public class UserServlet extends HttpServlet 
{
    
    protected void processRequest(HttpServletRequest request, 
                                    HttpServletResponse response)
            throws ServletException, IOException 
    {
         UserLogic CLogic = new UserLogic("jdbc:mysql://localhost/personalfinancedb?"
                + "user=root&password=12345&"
                + "autoReconnect=true&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true");
         
         MenuLogic CMenuLogic = new MenuLogic("jdbc:mysql://localhost/personalfinancedb?"
                + "user=root&password=12345&"
                + "autoReconnect=true&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true");
        //formid
        String strFormId = request.getParameter("formid");
        
       
        //seccion de register normal user
        if(strFormId.equals("1"))
        {
            String strUser = request.getParameter("user");
            String strNombre = request.getParameter("nombre");
            String strCorreo = request.getParameter("correo");
            String strPassword = request.getParameter("password");
            
           
            boolean hasFailed = 
                    CLogic.insertUser(strUser, strNombre, strCorreo, strPassword, UserType.NORMAL);
            
            request.getRequestDispatcher("index.html")
                   .forward(request, response);
        }
        
        //seccion para check login user attemp
        //hacer el login si necesito un UserObj
       
        if(strFormId.equals("2"))
        {
            String strUser = request.getParameter("user");
            String strPassword = request.getParameter("password");
            
            LoginObj ALoginUser = CLogic.getUserInDB(strUser, strPassword, UserType.ADMIN);
            LoginObj CLoginUser = CLogic.getUserInDB(strUser, strPassword, UserType.NORMAL);
            
            //verificacion como yo la necesito
            //Verificamos primero si el usuario existe y es normal
            if(CLoginUser!=null)
            {
                
                List<MenuObj> CList = CMenuLogic.getAllPlates();
                List<OrderObj> OList = CMenuLogic.getUserOrders(strUser);
                
                //log the user
                request.getSession().setAttribute("logged_user", CLoginUser);
                request.getSession().setAttribute("menus", CList);
                request.getSession().setAttribute("ordenesUsuario", OList);
           
                //log in al usuario eeexitooooo
                request.getRequestDispatcher("menu_user.html")
                       .forward(request, response);
                        
            }
            //verificamos ahora si el usuario existe y es administrador
            else if(ALoginUser!=null)
                    {
                
                List<MenuObj> CList = CMenuLogic.getMenu();
                
                List<OrderObj> OList = CMenuLogic.getOrders();
                
                request.getSession().setAttribute("logged_user", ALoginUser);
                request.getSession().setAttribute("menuCompleto", CList);
                request.getSession().setAttribute("ordenesCompletas", OList);
           
                request.getRequestDispatcher("menu_admin.html")
                       .forward(request, response);
                
                    
                    }
            //por último, si no verificamos que existe entonces debe haber algún error
            else
            {
                String strMessage = "Su usuario o su contraseña son incorrectos, vuelva a intentarlo.";
                request.getSession().setAttribute("message", strMessage);
                
                //usuario o password estan equivocados
                request.getRequestDispatcher("errorMessage.jsp")
                       .forward(request, response);
            }
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
