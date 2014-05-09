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

public class clsPersona {
    
    private static Connection cnx = new clsConexion().getConnetion();
    
     private static CallableStatement asignarValores(CallableStatement statement, clsEntidadPersona objPersona) throws SQLException{
        statement.setString("pnombres", objPersona.getNombres());
        statement.setString("papellidos", objPersona.getApellidos());
        statement.setString("pemail", objPersona.getEmail());
        
        return statement;
    }
     
            
    public static void agregarPersona(clsEntidadPersona objPersona){
        try{
            CallableStatement statement = cnx.prepareCall("{call sp_I_Persona(?,?,?)}");
            statement = asignarValores(statement,objPersona);
            statement.execute();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
    public static void modificarPersona(clsEntidadPersona objPersona){
        try{
            CallableStatement statement = cnx.prepareCall("{call sp_U_Persona(?,?,?,?)}");
            statement.setInt("pidPersona", objPersona.getIdPersona());
            statement = asignarValores(statement,objPersona);
            statement.executeUpdate();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
    public static ArrayList<clsEntidadPersona> listarPersonas(String busqueda){
        ArrayList<clsEntidadPersona> listaPersonas = new ArrayList<clsEntidadPersona>();
        try{
            ResultSet rs;
            CallableStatement statement = cnx.prepareCall("{call sp_S_Persona(?)}");
            statement.setString("pbusqueda", busqueda);
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
    
   public ResultSet consultarPersona() throws Exception{
        ResultSet rs = null;
        try{
            CallableStatement st = cnx.prepareCall("{call sp_S_Persona()}");
            rs = st.executeQuery();
            return rs;
           }
        catch(SQLException ex){
                    throw ex;
                    }
        }
}
