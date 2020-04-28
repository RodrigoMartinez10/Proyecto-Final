package com.proyectoprogramacion.objects;
public class LoginObj 
{
    //variables de instancia de este pojo
    private int m_iId;
    private String m_strUser;
    private String m_strPassword;
    private int m_idType;
    private String m_strType; 

    public LoginObj(int p_iId, String p_strUser, 
            String p_strPassword, int p_idType, String p_strType) 
    {
        setId(p_iId);
        setUser(p_strUser);
        setPassword(p_strPassword);
        setType(p_idType);
        setTypeName(p_strType);
    }
    
    public int getId() {
        return m_iId;
    }

    private void setId(int p_iId) {
        this.m_iId = p_iId;
    }

    public String getUser() {
        return m_strUser;
    }

    private void setUser(String p_strUser) {
        this.m_strUser = p_strUser;
    }

    public String getPassword() {
        return m_strPassword;
    }

    private void setPassword(String p_strPassword) {
        this.m_strPassword = p_strPassword;
    }

    public int getType() {
        return m_idType;
    }

    private void setType(int p_idtype) {
        this.m_idType = p_idtype;
    }

    public String getTypeName() {
        return m_strType;
    }

    private void setTypeName(String p_strType) {
        this.m_strType = p_strType;
    }    
}
