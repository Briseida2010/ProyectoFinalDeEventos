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

public class clsPrograma {
    
    private static Connection cnx = new clsConexion().getConnetion();
    
            
    public static void agregarPrograma (clsEntidadPrograma objPrograma){
        try{
            CallableStatement statement = cnx.prepareCall("{call sp_I_Programa(?,?,?,?,?)}");
            statement = asignarValores(statement,objPrograma);
            statement.execute();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
    public static void modificarPrograma (clsEntidadPrograma objPrograma){
        try{
            CallableStatement statement = cnx.prepareCall("{call sp_U_Programa(?,?,?,?,?)}");
            statement = asignarValores(statement,objPrograma);
            statement.executeUpdate();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
    public static ArrayList<clsEntidadPersona> listarPonentesNoInscritos(String pbusqueda,int idEvento){
       ArrayList<clsEntidadPersona> listaPersonas = new ArrayList<clsEntidadPersona>();
        try{
            ResultSet rs;
            CallableStatement statement = cnx.prepareCall("{call sp_S_PonenteEvento(?,?)}");
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
    
    public static ArrayList<clsEntidadPrograma> listarProgramas(String busqueda,int Evento){
        ArrayList<clsEntidadPrograma> listaProgramas = new ArrayList<clsEntidadPrograma>();
        try{
            ResultSet rs;
            CallableStatement statement = cnx.prepareCall("{call sp_S_Programa(?,?)}");
            statement.setString("pbusqueda", busqueda);
            statement.setInt("pidEvento", Evento);
            rs = statement.executeQuery();          
            while(rs.next()){
                clsEntidadPrograma objPrograma = new clsEntidadPrograma();
                objPrograma.setIdEvento(rs.getInt("idEvento"));
                objPrograma.setIdPersona(rs.getInt("idPersona"));
                objPrograma.setNombre(rs.getString("nombre"));
                objPrograma.setTema(rs.getString("tema"));
                objPrograma.setFechaInicio(rs.getString("fechaInicio"));
                objPrograma.setFechaFinal(rs.getString("fechaFinal"));
                
                listaProgramas.add(objPrograma);
            }
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return listaProgramas;
    }
    
    private static CallableStatement asignarValores(CallableStatement statement, clsEntidadPrograma objPrograma) throws SQLException{
        statement.setInt("pidEvento", objPrograma.getIdEvento());
        statement.setInt("pidPersona", objPrograma.getIdPersona());
        statement.setString("ptema", objPrograma.getTema());
        statement.setString("pfechaInicio", objPrograma.getFechaInicio());
        statement.setString("pfechaFinal", objPrograma.getFechaFinal());
        return statement;
    }
    
      public ResultSet consultarPrograma() throws Exception{
        ResultSet rs = null;
        try{
            CallableStatement st = cnx.prepareCall("{call sp_S_Programa()}");
            rs = st.executeQuery();
            return rs;
           }
        catch(SQLException ex){
                    throw ex;
                    }
        }
}