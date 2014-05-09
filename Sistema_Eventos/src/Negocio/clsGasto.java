package Negocio;

import Conexion.*;
import Entidad.*;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class clsGasto {
    private static Connection cnx = new clsConexion().getConnetion();
    
    public static void agregarGasto (clsEntidadGasto objGasto){
        try{
            CallableStatement statement = cnx.prepareCall("{call sp_I_Gasto(?,?)}");
            statement = asignarValores(statement,objGasto);
            statement.execute();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
   
    
    public static void modificarGasto (clsEntidadGasto objGasto){
        try{
            CallableStatement statement = cnx.prepareCall("{call sp_U_Gasto(?,?)}");
            statement.setInt("pidGasto", objGasto.getIdGasto());
            statement = asignarValores(statement,objGasto);
            statement.executeUpdate();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
    public static ArrayList<clsEntidadGasto> listarGasto(String busqueda){
        ArrayList<clsEntidadGasto> listaGasto = new ArrayList<clsEntidadGasto>();
        try{
            ResultSet rs;
            CallableStatement statement = cnx.prepareCall("{call sp_S_Gasto(?)}");
            statement.setString("pbusqueda", busqueda);
            rs = statement.executeQuery();          
            while(rs.next()){
                clsEntidadGasto objGasto = new clsEntidadGasto();
                objGasto.setIdGasto(rs.getInt("idGasto"));
                objGasto.setConcepto(rs.getString("concepto"));
                objGasto.setMonto(rs.getDouble("monto"));
    
                listaGasto.add(objGasto);
            }
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return listaGasto;
    }
    
    
    
    private static CallableStatement asignarValores(CallableStatement statement, clsEntidadGasto objGasto) throws SQLException{
        statement.setString("pconcepto", objGasto.getConcepto());
        statement.setDouble("pmonto", objGasto.getMonto());
        
        return statement;
    }
    
}
