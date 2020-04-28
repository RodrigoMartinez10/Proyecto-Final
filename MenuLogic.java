package com.proyectoprogramacion.logic;

import balcorpfw.database.DatabaseX;
import balcorpfw.logic.Logic;
import com.proyectoprogramacion.objects.MenuObj;
import com.proyectoprogramacion.objects.OrderObj;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MenuLogic extends Logic
{
    
    public MenuLogic(String pConnectionString) {
        super(pConnectionString);
    }

    public List<MenuObj> getAllPlates() 
    {
        List<MenuObj> CList = null;
        DatabaseX CDatabase = getDatabase();
        String strSql = "SELECT * FROM personalfinancedb.platillos where Disponibilidad = 1;";
        ResultSet CResult = CDatabase.executeQuery(strSql);
        
        
        if(CResult!=null)
        {
            try 
            {
                double dblPrecio;
                String strName;
                String strType;
                int iDisponibilidad;
                String strDescripcion;
                String strImagen;
                MenuObj CTemp;
                
                CList = new ArrayList<>();
                
                while(CResult.next())
                {
                    dblPrecio = CResult.getDouble("Precio");
                    strName = CResult.getString("Nombre");
                    strType = CResult.getString("Tipo");
                    iDisponibilidad = CResult.getInt("Disponibilidad");
                    strDescripcion = CResult.getString("Descripción");
                    strImagen = CResult.getString("Imagen");
                    CTemp = new MenuObj(strName, dblPrecio, strType, iDisponibilidad, strDescripcion, strImagen);
                    CList.add(CTemp);
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(MenuLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return CList;
    }
    
    
    public List<MenuObj> getMenu() 
    {
        List<MenuObj> CList = null;
        DatabaseX CDatabase = getDatabase();
        String strSql = "SELECT * FROM personalfinancedb.platillos;";
        ResultSet CResult = CDatabase.executeQuery(strSql);
        
        
        if(CResult!=null)
        {
            try 
            {
                double dblPrecio;
                String strName;
                String strType;
                int iDisponibilidad;
                String strDescripcion;
                String strImagen;
                MenuObj CTemp;
                
                CList = new ArrayList<>();
                
                while(CResult.next())
                {
                    dblPrecio = CResult.getDouble("Precio");
                    strName =  CResult.getString("Nombre");
                    strType = CResult.getString("Tipo");
                    iDisponibilidad = CResult.getInt("Disponibilidad");
                    strDescripcion = CResult.getString("Descripción");
                    strImagen = CResult.getString("Imagen");
                    CTemp = new MenuObj(strName, dblPrecio, strType, iDisponibilidad, strDescripcion, strImagen);
                    CList.add(CTemp);
                    
             
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(MenuLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return CList;
    }
    
    public boolean insertMenu(String p_strName, double p_dblPrecio, int p_iDisponibilidad, String p_strType,
            String p_strDescripcion, String p_strImagen)  
    {
        boolean hasFailed;
        DatabaseX database = getDatabase();
        
        String strSql = "INSERT INTO personalfinancedb.platillos"
                + "(Nombre, Precio, Disponibilidad, Tipo, Descripción, Imagen) "
                + "VALUES('"+p_strName+"','"+p_dblPrecio+"', '0','"+p_strType+"','"+p_strDescripcion+"','"+p_strImagen+"');";
        hasFailed = database.executeNonQueryBool(strSql);
        return hasFailed;
    }
    
    public void actualizarComida(String[] p_CLista)
    {
        DatabaseX CDatabase = getDatabase();
        String strSQL;
        for (String comida : p_CLista) {
            
            strSQL = "UPDATE personalfinancedb.platillos SET Disponibilidad = '1' "
                    + "WHERE(Nombre = '"+comida+"');";
            CDatabase.executeNonQueryBool(strSQL);
        
        }
    }
    
    public void quitarComida(String[] p_CLista)
    {
        DatabaseX CDatabase = getDatabase();
        String strSQL;
        for (String food : p_CLista) {
            
            strSQL = "UPDATE personalfinancedb.platillos SET Disponibilidad = '0' "
                    + "WHERE(Nombre = '"+food+"');";
            CDatabase.executeNonQueryBool(strSQL);
        
        }
    }
    
    public boolean insertOrder(String p_strUser, String p_fecha, String p_hora, String p_strPlato,
            String p_strComplemento, String p_strBebida, double p_dblTotal)  
    {
        boolean hasFailed;
        DatabaseX database = getDatabase();
        
        String strSql = "INSERT INTO personalfinancedb.ordenes"
                + "(idOrden, Usuario, Fecha, Hora, Plato, Complemento, Bebida, Estado, Total) "
                + "VALUES(0,'"+p_strUser+"','"+p_fecha+"','"+p_hora+"','"+p_strPlato+"','"+p_strComplemento+"','"+p_strBebida+"','Activa', '"+p_dblTotal+"');";
        hasFailed = database.executeNonQueryBool(strSql);
        return hasFailed;
    }
    
    
    
    public List<OrderObj> getOrders() 
    {
        List<OrderObj> OList = null;
        DatabaseX CDatabase = getDatabase();
        String strSql = "SELECT * FROM personalfinancedb.ordenes;";
        ResultSet CResult = CDatabase.executeQuery(strSql);
        
        
        if(CResult!=null)
        {
            try 
            {
                int iId;
                String strUsuario;
                String strFecha;
                String strHora;
                String strPlato;
                String strComplemento;
                String strBebida;
                String strEstado;
                double dblTotal;
                OrderObj CTemp;
                
                OList = new ArrayList<>();
                
                while(CResult.next())
                {
                    iId = CResult.getInt("idOrden");
                    strUsuario =  CResult.getString("Usuario");
                    strFecha = CResult.getString("Fecha");
                    strHora = CResult.getString("Hora");
                    strPlato = CResult.getString("Plato");
                    strComplemento = CResult.getString("Complemento");
                    strBebida = CResult.getString("Bebida");
                    strEstado = CResult.getString("Estado");
                    dblTotal = CResult.getDouble("Total");
                    CTemp = new OrderObj(iId, strUsuario, strFecha, strHora, strPlato, strComplemento, strBebida, strEstado, dblTotal);
                    OList.add(CTemp);
                    
             
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(MenuLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return OList;
    }
    
    public List<OrderObj> getUserOrders(String p_strUser) 
    {
        
        List<OrderObj> OList = null;
        DatabaseX CDatabase = getDatabase();
        String strSql = "SELECT * FROM personalfinancedb.ordenes where Usuario like '"+p_strUser+"';";
        ResultSet CResult = CDatabase.executeQuery(strSql);
        
        
        if(CResult!=null)
        {
            try 
            {
                int iId;
                String strUsuario;
                String strFecha;
                String strHora;
                String strPlato;
                String strComplemento;
                String strBebida;
                String strEstado;
                double dblTotal;
                OrderObj CTemp;
                
                OList = new ArrayList<>();
                
                while(CResult.next())
                {
                    iId = CResult.getInt("idOrden");
                    strUsuario =  CResult.getString("Usuario");
                    strFecha = CResult.getString("Fecha");
                    strHora = CResult.getString("Hora");
                    strPlato = CResult.getString("Plato");
                    strComplemento = CResult.getString("Complemento");
                    strBebida = CResult.getString("Bebida");
                    strEstado = CResult.getString("Estado");
                    dblTotal = CResult.getDouble("Total");
                    CTemp = new OrderObj(iId, strUsuario, strFecha, strHora, strPlato, strComplemento, strBebida, strEstado, dblTotal);
                    OList.add(CTemp);
                    
             
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(MenuLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return OList;
    }
    
     public void actualizarOrden(String p_strId, String p_strEstado)
    {
        DatabaseX CDatabase = getDatabase();
        String strSQL;
        strSQL = "UPDATE personalfinancedb.ordenes SET Estado = '"+p_strEstado+"' "
                    + "WHERE(idOrden = '"+p_strId+"');";
            CDatabase.executeNonQueryBool(strSQL);
        
        }
}

    
     
    
   
