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

public class clsComision {
 
    private static Connection cnx = new clsConexion().getConnetion();
    
    public static void agregarComision (clsEntidadComision objComision){
        try{
            CallableStatement statement = cnx.prepareCall("{call sp_I_Gasto(?,?,?)}");
            statement = asignarValores(statement,objComision);
            statement.execute();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
   
    public static void modificarComision (clsEntidadComision objComision){
        try{
            CallableStatement statement = cnx.prepareCall("{call sp_U_Comision(?,?,?)}");
            statement.setInt("pidPersona", objComision.getIdPersona());
            statement.setInt("pidEvento", objComision.getIdEvento());
            statement = asignarValores(statement,objComision);
            statement.executeUpdate();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
    public static ArrayList<clsEntidadComision> listarComision(String busqueda){
        ArrayList<clsEntidadComision> listaComision = new ArrayList<clsEntidadComision>();
        try{
            ResultSet rs;
            CallableStatement statement = cnx.prepareCall("{call sp_S_Comision(?)}");
            statement.setString("pbusqueda", busqueda);
            rs = statement.executeQuery();          
            while(rs.next()){
                clsEntidadComision objComision = new clsEntidadComision();
                objComision.setIdPersona(rs.getInt("idPersona"));
                objComision.setIdEvento(rs.getInt("idEvento"));
                objComision.setTipo(rs.getString("tipo"));
              
    
                listaComision.add(objComision);
            }
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return listaComision;
    }
       
    
    private static CallableStatement asignarValores(CallableStatement statement, clsEntidadComision objComision) throws SQLException{
        
        statement.setString("ptipo", objComision.getTipo());
        
        return statement;
    }
    
   public ResultSet consultarComision() throws Exception{
        ResultSet rs = null;
        try{
            CallableStatement st = cnx.prepareCall("{call sp_S_Comision(?)}");
            st.setString("pbusqueda", "");
            rs = st.executeQuery();
            return rs;
           }
        catch(SQLException ex){
                    throw ex;
                    }
        } 
   
   public ResultSet consultarComisionEvento(int idEvento) throws Exception{
        ResultSet rs = null;
        try{
            
            CallableStatement st = cnx.prepareCall("{call sp_S_ComisionEvento(?)}");
           st.setInt("pidEvento", idEvento);
            rs = st.executeQuery();
            return rs;
           }
        catch(SQLException ex){
                    throw ex;
                    }
        }
    
    
}
