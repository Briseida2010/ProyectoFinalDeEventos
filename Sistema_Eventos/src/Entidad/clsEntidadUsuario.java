/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Entidad;

public class clsEntidadUsuario extends clsEntidadPersona{
    
    String usuario;
    String password;
    String indicadorInscripcion;
    String indicadorEvento;
    String indicadorGasto;
    String indicadorPrograma;
    String indicadorComision;

    public String getIndicadorComision() {
        return indicadorComision;
    }

    public void setIndicadorComision(String indicadorComision) {
        this.indicadorComision = indicadorComision;
    }
    String indicadorUsuario;
    String indicadorActivo;

    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIndicadorInscripcion() {
        return indicadorInscripcion;
    }

    public void setIndicadorInscripcion(String indicadorInscripcion) {
        this.indicadorInscripcion = indicadorInscripcion;
    }

    public String getIndicadorEvento() {
        return indicadorEvento;
    }

    public void setIndicadorEvento(String indicadorEvento) {
        this.indicadorEvento = indicadorEvento;
    }

    public String getIndicadorGasto() {
        return indicadorGasto;
    }

    public void setIndicadorGasto(String indicadorGasto) {
        this.indicadorGasto = indicadorGasto;
    }

    public String getIndicadorPrograma() {
        return indicadorPrograma;
    }

    public void setIndicadorPrograma(String indicadorPrograma) {
        this.indicadorPrograma = indicadorPrograma;
    }

    public String getIndicadorUsuario() {
        return indicadorUsuario;
    }

    public void setIndicadorUsuario(String indicadorUsuario) {
        this.indicadorUsuario = indicadorUsuario;
    }

    public String getIndicadorActivo() {
        return indicadorActivo;
    }

    public void setIndicadorActivo(String indicadorActivo) {
        this.indicadorActivo = indicadorActivo;
    }
    
    
}
