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

public class clsEvento {
    
    private static Connection cnx = new clsConexion().getConnetion();
    
        private static CallableStatement asignarValores(CallableStatement statement, clsEntidadEvento objEvento) throws SQLException{
        statement.setString("ptipo", objEvento.getTipo());
        statement.setString("pfechaInicio", objEvento.getFechaInicio());
        statement.setString("pfechaFinal", objEvento.getFechaFinal());
        
        return statement;
    }
    
            
    public static void agregarEvento(clsEntidadEvento objEvento){
        try{
            CallableStatement statement = cnx.prepareCall("{call sp_I_Evento(?,?,?)}");
            statement = asignarValores(statement,objEvento);
            statement.execute();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
    public static void modificarEvento(clsEntidadEvento objEvento){
        try{
            CallableStatement statement = cnx.prepareCall("{call sp_U_Evento(?,?,?,?)}");
            statement.setInt("pidEvento", objEvento.getIdEvento());
            statement = asignarValores(statement,objEvento);
            statement.executeUpdate();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
    public static ArrayList<clsEntidadEvento> listarEventos(String busqueda){
        ArrayList<clsEntidadEvento> listaEventos = new ArrayList<>();
        try{
            ResultSet rs;
            CallableStatement statement = cnx.prepareCall("{call sp_S_Evento(?)}");
            statement.setString("pbusqueda", busqueda);
            rs = statement.executeQuery();          
            while(rs.next()){
                clsEntidadEvento objEvento = new clsEntidadEvento();
                objEvento.setIdEvento(rs.getInt("idEvento"));
                objEvento.setTitulo(rs.getString("titulo"));
                objEvento.setTipo(rs.getString("tipo"));
                objEvento.setFechaInicio(rs.getString("fechaInicio"));
                objEvento.setFechaFinal(rs.getString("fechaFinal"));
                
                listaEventos.add(objEvento);
            }
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return listaEventos;
    }
   
    public ResultSet consultarEvento() throws Exception{
        ResultSet rs = null;
        try{
            CallableStatement st = cnx.prepareCall("{call sp_S_Evento(?)}");
            st.setString("pbusqueda", "");
            rs = st.executeQuery();
            return rs;
           }
        catch(SQLException ex){
                    throw ex;
                    }
        }

    public ResultSet consultarProgramaEvento(int idEvento) throws Exception{
        ResultSet rs = null;
        try{
            
            CallableStatement st = cnx.prepareCall("{call sp_S_ProgramaEvento(?)}");
           st.setInt("pidEvento", idEvento);
            rs = st.executeQuery();
            return rs;
           }
        catch(SQLException ex){
                    throw ex;
                    }
        }

    public ResultSet consultarGastoEvento(int titulo, String tipo) throws Exception{
        ResultSet rs = null;
        try{
            
            CallableStatement st = cnx.prepareCall("{call sp_S_GastoTotal(?,?)}");
           st.setInt("ptitulo", titulo);
           st.setString("ptipo", tipo);
            rs = st.executeQuery();
            return rs;
           }
        catch(SQLException ex){
                    throw ex;
                    }
        }

}
