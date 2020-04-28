/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.proyectoprogramacion.objects;

/**
 *
 * @author Ro-Ma
 */
public class OrderObj {
    
    private int m_iId;
    private String m_strUsuario;
    private String m_strFecha;
    private String m_strHora;
    private String m_strPlato;
    private String m_strComplemento;
    private String m_strBebida;
    private String m_strEstado;
    private double m_dblTotal;

    public OrderObj(int p_iId, String p_strUsuario,  
            String p_strFecha, String p_strHora,String p_strPlato, String p_strComplemento,
            String p_strBebida, String p_strEstado, double p_dblTotal) 
    {
        setId(p_iId);
        setUsuario(p_strUsuario);
        setFecha(p_strFecha);
        setHora(p_strHora);
        setPlato(p_strPlato);
        setComplemento(p_strComplemento);
        setBebida(p_strBebida);
        setEstado(p_strEstado);
        setTotal(p_dblTotal);
    }
    
     public int getId() {
        return m_iId;
    }

    private void setId(int p_iId) {
        this.m_iId = p_iId;
    }
    
    
    public String getUsuario() {
        return m_strUsuario;
    }

    private void setUsuario(String p_strUsuario) {
        this.m_strUsuario = p_strUsuario;
    }

    public String getFecha() {
        return m_strFecha;
    }

    private void setFecha(String p_strFecha) {
        this.m_strFecha = p_strFecha;
    }

    public String getHora() {
        return m_strHora;
    }

    private void setHora(String p_strHora) {
        this.m_strHora = p_strHora;
    }

    public String getPlato() {
        return m_strPlato;
    }

    private void setPlato(String p_strPlato) {
        this.m_strPlato = p_strPlato;
    }

    public String getComplemento() {
        return m_strComplemento;
    }

    private void setComplemento(String p_strComplemento) {
        this.m_strComplemento = p_strComplemento;
    }

    public String getBebida() {
        return m_strBebida;
    }

    private void setBebida(String p_strBebida) {
        this.m_strBebida = p_strBebida;
    }

    public String getEstado() {
        return m_strEstado;
    }

    private void setEstado(String p_strEstado) {
        this.m_strEstado = p_strEstado;
    }

    public double getTotal() {
        return m_dblTotal;
    }

    private void setTotal(double p_dblTotal) {
        this.m_dblTotal = p_dblTotal;
    }


    
}
