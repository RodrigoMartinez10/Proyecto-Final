package com.proyectoprogramacion.logic;

import balcorpfw.database.DatabaseX;
import balcorpfw.logic.Logic;
import com.proyectoprogramacion.enums.UserType;
import com.proyectoprogramacion.objects.LoginObj;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Ro-Ma
 */
public class UserLogic extends Logic
{
    public UserLogic(String pConnectionString) {
        super(pConnectionString);
    }

   
    public boolean insertUser(String p_strUser, String p_strNombre, String p_strCorreo,
            String p_strPassword, UserType p_CUserType)  
    {
        boolean hasFailed;
        DatabaseX database = getDatabase();
        int iUserType = checkUserType(p_CUserType);
        String strSql = "INSERT INTO personalfinancedb.usuarios"
                + "(id, user,nombre,correo, password, idtype) "
                + "VALUES(0,'"+p_strUser+"','"+p_strNombre+"','"+p_strCorreo+"','"+p_strPassword+"',"+iUserType+");";
        hasFailed = database.executeNonQueryBool(strSql);
        return hasFailed;
    }

    private int checkUserType(UserType p_CUserType) 
    {
        int iUserType;
        if(p_CUserType == UserType.NORMAL)
        {
            iUserType = 1;
        }
        else
        {
            iUserType = 2;
        }
        return iUserType;
    }
    
    private String checkUserTypeName(UserType p_CUserType)
    {
        String strUserType;
        if(p_CUserType == UserType.NORMAL)
        {
            strUserType = "normal";
        }
        else
        {
            strUserType = "admin";
        }
        return strUserType;        
    }
public LoginObj getUserInDB(String p_strUser, 
            String p_strPassword, UserType p_CUserType) 
    {
        LoginObj CUser = null;
        DatabaseX CDatabase  = getDatabase();
        int iUserType = checkUserType(p_CUserType);
        String strSql = "SELECT * "
                + "FROM personalfinancedb.usuarios "
                + "where user like '"+p_strUser+"' "
                + "and password like '"+p_strPassword+"' "
                + "and idtype="+iUserType+";";
        ResultSet CResult = CDatabase.executeQuery(strSql);
        
        if(CResult!=null)
        {
            try 
            {
                int iId;
                String strUser;
                String strPassword;
                int iType;
                String strTypeName;
                
                while(CResult.next())
                {
                    iId = CResult.getInt("id");
                    strUser = CResult.getString("user");
                    strPassword = CResult.getString("password");
                    iType = CResult.getInt("idtype");
                    
                    strTypeName = checkUserTypeName(p_CUserType);
                    CUser = new LoginObj(iId, p_strUser, p_strPassword, iType, strTypeName);
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(UserLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return CUser;
    }  

}


