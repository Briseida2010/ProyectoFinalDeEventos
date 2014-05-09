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
            CallableStatement statement = cnx.prepareCall("{call sp_I_Inscripcion(?,?,?,?)}");
            statement = asignarValores(statement,objInscripcion);
            statement.execute();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
    public static void modificarInscripcion (clsEntidadInscripcion objInscripcion){
        try{
            CallableStatement statement = cnx.prepareCall("{call sp_U_Inscripcion(?,?,?,?)}");
            statement.setInt("pidPersona", objInscripcion.getIdPersona());
            statement = asignarValores(statement,objInscripcion);
            statement.executeUpdate();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
    public static ArrayList<clsEntidadInscripcion> listarInscripcion(String busqueda){
        ArrayList<clsEntidadInscripcion> listaInscripcion = new ArrayList<clsEntidadInscripcion>();
        try{
            ResultSet rs;
            CallableStatement statement = cnx.prepareCall("{call sp_S_Inscripcion(?)}");
            statement.setString("pbusqueda", busqueda);
            rs = statement.executeQuery();          
            while(rs.next()){
                clsEntidadInscripcion objInscripcion = new clsEntidadInscripcion();
                objInscripcion.setIdEvento(rs.getInt("idPersona"));
                
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
        statement.setString("idPersona", objInscripcion.getTipoPago());
        statement.setDouble("idEvento", objInscripcion.getMonto());
        statement.setString("tipoPago", objInscripcion.getTipoPago());
        statement.setDouble("monto", objInscripcion.getMonto());
          statement.setDouble("monto", objInscripcion.getMonto());
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
