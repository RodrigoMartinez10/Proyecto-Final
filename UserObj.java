package com.proyectoprogramacion.objects;

//quiero que sea un pojo

/**
 *
 * @author Ro-Ma
 */
public class UserObj 
{
    //variables de instancia de este pojo
    private int m_iId;
    private String m_strUser;
    private String m_strPassword;
    private int m_idType;
    private String m_strType; 
    private String m_strNombre;
    private String m_strCorreo;

    

    public UserObj(int p_iId, String p_strUser, String p_strNombre,String p_strCorreo, 
            String p_strPassword, int p_idType, String p_strType) 
    {
        setId(p_iId);
        setUser(p_strUser);
        setNombre(p_strNombre);
        setCorreo(p_strCorreo);
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
    
    public String getNombre() {
        return m_strNombre;
    }

    private void setNombre(String p_strNombre) {
        this.m_strNombre = p_strNombre;
    }

    public String getCorreo() {
        return m_strCorreo;
    }

    public final void setCorreo(String m_strCorreo) {
        this.m_strCorreo = m_strCorreo;
    }

}
