/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Negocio;
import Conexion.*;
import Entidad.*;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class clsInscripcion {
    
    private static Connection cnx = new clsConexion().getConnetion();
    
            
    public static void agregarInscripcion(clsEntidadInscripcion objInscripcion){
        try{
            CallableStatement statement = cnx.prepareCall("{call sp_I_Inscripcion(?,?,?,?,?)}");
            statement = asignarValores(statement,objInscripcion);
            statement.execute();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
    public static void modificarInscripcion (clsEntidadInscripcion objInscripcion){
        try{
            CallableStatement statement = cnx.prepareCall("{call sp_U_Inscripcion(?,?,?,?,?)}");
            statement = asignarValores(statement,objInscripcion);
            statement.executeUpdate();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
    public static ArrayList<clsEntidadPersona> listarPersonaNoInscritas(String pbusqueda,int idEvento){
       ArrayList<clsEntidadPersona> listaPersonas = new ArrayList<clsEntidadPersona>();
        try{
            ResultSet rs;
            CallableStatement statement = cnx.prepareCall("{call sp_S_PersonaInscripcion(?,?)}");
            statement.setString("pbusqueda", pbusqueda);
            statement.setInt("pidEvento", idEvento);
            rs = statement.executeQuery();          
            while(rs.next()){
                clsEntidadPersona objPersona = new clsEntidadPersona();
                objPersona.setIdPersona(rs.getInt("idPersona"));
                objPersona.setNombres(rs.getString("nombres"));
                objPersona.setApellidos(rs.getString("apellidos"));
                objPersona.setEmail(rs.getString("email"));
                
                listaPersonas.add(objPersona);
            }
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return listaPersonas;     
    }
    
    public static ArrayList<clsEntidadInscripcion> listarInscripcion(int idEvento){
        ArrayList<clsEntidadInscripcion> listaInscripcion = new ArrayList<clsEntidadInscripcion>();
        try{
            ResultSet rs;
            CallableStatement statement = cnx.prepareCall("{call sp_S_Inscripcion(?)}");
            statement.setInt("pidEvento", idEvento);
            rs = statement.executeQuery();          
            while(rs.next()){
                clsEntidadInscripcion objInscripcion = new clsEntidadInscripcion();
                objInscripcion.setIdPersona(rs.getInt("idPersona"));
                objInscripcion.setNombre(rs.getString("nombre"));
                objInscripcion.setIdEvento(rs.getInt("idEvento"));
                objInscripcion.setTipoPago(rs.getString("tipoPago"));
                objInscripcion.setMonto(rs.getDouble("monto"));
                objInscripcion.setFecha(rs.getString("fecha"));
               
               listaInscripcion.add(objInscripcion);
                
                
            }
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return listaInscripcion;
    }
    
    private static CallableStatement asignarValores(CallableStatement statement, clsEntidadInscripcion objInscripcion) throws SQLException{
        statement.setInt("pidPersona", objInscripcion.getIdPersona());
        statement.setInt("pidEvento", objInscripcion.getIdEvento());
        statement.setString("ptipoPago", objInscripcion.getTipoPago());
        statement.setDouble("pmonto", objInscripcion.getMonto());
        statement.setString("pfecha", objInscripcion.getFecha());
        return statement;
    }
    
    public ResultSet consultarInscripcion() throws Exception{
        ResultSet rs = null;
        try{
            CallableStatement st = cnx.prepareCall("{call sp_S_Inscripcion()}");
            rs = st.executeQuery();
            return rs;
           }
        catch(SQLException ex){
                    throw ex;
                    }
        }
    
}
