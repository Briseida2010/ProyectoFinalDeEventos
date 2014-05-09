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

public class clsPonente {
    
    
    private static Connection cnx = new clsConexion().getConnetion();
    
    private static CallableStatement asignarValores(CallableStatement statement, clsEntidadPonente objPonente) throws SQLException{
        statement.setString("pnombres", objPonente.getNombres());
        statement.setString("papellidos", objPonente.getApellidos());
        statement.setString("pemail", objPonente.getEmail());
        statement.setString("pcelular", objPonente.getCelular());
        statement.setString("pgradoAcademico", objPonente.getGradoAcademico());
        
        return statement;
    }
            
    public static void agregarPonente(clsEntidadPonente objPonente){
        try{
            CallableStatement statement = cnx.prepareCall("{call sp_I_Ponente(?,?,?,?,?)}");
            statement = asignarValores(statement,objPonente);
            statement.execute();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
    public static void modificarPonente(clsEntidadPonente objPonente){
        try{
            CallableStatement statement = cnx.prepareCall("{call sp_U_Ponente(?,?,?,?,?,?)}");
            statement.setInt("pidPersona", objPonente.getIdPersona());
            statement = asignarValores(statement,objPonente);
            statement.executeUpdate();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
    public static ArrayList<clsEntidadPonente> listarPonentes(String busqueda){
        ArrayList<clsEntidadPonente> listaPonentes = new ArrayList<clsEntidadPonente>();
        try{
            ResultSet rs;
            CallableStatement statement = cnx.prepareCall("{call sp_S_Ponente(?)}");
            statement.setString("pbusqueda", busqueda);
            rs = statement.executeQuery();          
            while(rs.next()){
                clsEntidadPonente objPonente = new clsEntidadPonente();
                objPonente.setIdPersona(rs.getInt("idPersona"));
                objPonente.setNombres(rs.getString("nombres"));
                objPonente.setApellidos(rs.getString("apellidos"));
                objPonente.setEmail(rs.getString("email"));
                objPonente.setCelular(rs.getString("celular"));
                objPonente.setGradoAcademico(rs.getString("gradoAcademico"));
                
                listaPonentes.add(objPonente);
            }
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return listaPonentes;
    }
    
   public ResultSet consultarPonente() throws Exception{
        ResultSet rs = null;
        try{
            CallableStatement st = cnx.prepareCall("{call sp_S_Ponente()}");
            rs = st.executeQuery();
            return rs;
           }
        catch(SQLException ex){
                    throw ex;
                    }
        }
    
   public ResultSet consultarPonenteCriterio(String criterio, String busqueda) throws Exception{
        ResultSet rs = null;
        try{
            CallableStatement st = cnx.prepareCall("{USP_S_PONENTE_Criterio(?,?)}");
            st.setString("pcriterio", criterio);
            st.setString("pbusqueda", busqueda);
            rs = st.executeQuery();
            return rs;
            }
        catch(SQLException ex){
                    throw ex;
                    }
        }
    
    
}
