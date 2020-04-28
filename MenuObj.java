package com.proyectoprogramacion.objects;

//pojo
public class MenuObj 
{
    private double m_dblPrecio;
    private String m_strName;
    private String m_strType;
    private int m_iDisponibilidad;
    private String m_strDescripcion;
    private String m_strImagen;

    public MenuObj(String p_strName, double p_dblPrecio,  
            String p_strType, int p_iDisponibilidad, String p_strDescripcion,String p_strImagen) 
    {
        setPrecio(p_dblPrecio);
        setName(p_strName);
        setType(p_strType);
        setDisponibilidad(p_iDisponibilidad);
        setDescripcion(p_strDescripcion);
        setImagen(p_strImagen);
    }

    public String getDescripcion() {
        return m_strDescripcion;
    }

    private void setDescripcion(String p_strDescripcion) {
        this.m_strDescripcion = p_strDescripcion;
    }

    public String getImagen() {
        return m_strImagen;
    }

    private void setImagen(String p_strImagen) {
        this.m_strImagen = p_strImagen;
    }

    public String getType() {
        return m_strType;
    }

    private void setType(String p_strType) {
        this.m_strType = p_strType;
    }

    public int getDisponibilidad() {
        return m_iDisponibilidad;
    }

    private void setDisponibilidad(int p_iDisponibilidad) {
        this.m_iDisponibilidad = p_iDisponibilidad;
    }
    
    public double getPrecio() {
        return m_dblPrecio;
    }

    private void setPrecio(double p_dblPrecio) {
        this.m_dblPrecio = p_dblPrecio;
    }

    public String getName() {
        return m_strName;
    }

    private void setName(String p_strName) {
        this.m_strName = p_strName;
    }
    
    
}
