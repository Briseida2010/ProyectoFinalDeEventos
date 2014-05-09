

package Negocio;
import Conexion.*;
import Entidad.*;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class clsUsuario {
    
    private static Connection cnx = new clsConexion().getConnetion();
    
    public ResultSet LoginUsuario(String usu,String pass) throws Exception{
        ResultSet rs = null;
        try{
            CallableStatement cst = cnx.prepareCall("{Call sp_S_usuarioLogin(?,?)}");
            cst.setString("pnomb_usu", usu);
            cst.setString("ppass_usu", pass);
            rs= cst.executeQuery();
            return rs;
        }catch(SQLException ex){
         javax.swing.JOptionPane.showMessageDialog(null, ex.getMessage());
         throw ex;
        }
    }
            
    public static void agregarUsuario (clsEntidadUsuario objUsuario){
        try{
            CallableStatement statement = cnx.prepareCall("{call sp_I_Usuario(?,?,?,?,?,?,?,?,?,?,?,?)}");
            statement = asignarValores(statement,objUsuario);
            statement.execute();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
    public static void modificarUsuario (clsEntidadUsuario objUsuario){
        try{
            CallableStatement statement = cnx.prepareCall("{call sp_U_Usuario(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            statement.setInt("pidPersona", objUsuario.getIdPersona());
            statement = asignarValores(statement,objUsuario);
            statement.executeUpdate();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
    public static ArrayList<clsEntidadUsuario> listarUsuarios(String busqueda){
        ArrayList<clsEntidadUsuario> listaUsuarios = new ArrayList<clsEntidadUsuario>();
        try{
            ResultSet rs;
            CallableStatement statement = cnx.prepareCall("{call sp_S_Usuario(?)}");
            statement.setString("pbusqueda", busqueda);
            rs = statement.executeQuery();          
            while(rs.next()){
                clsEntidadUsuario objUsuario = new clsEntidadUsuario();
                objUsuario.setIdPersona(rs.getInt("idPersona"));
                objUsuario.setNombres(rs.getString("nombres"));
                objUsuario.setApellidos(rs.getString("apellidos"));
                objUsuario.setEmail(rs.getString("email"));
                objUsuario.setUsuario(rs.getString("usuario"));
                objUsuario.setPassword(rs.getString("password"));
                objUsuario.setIndicadorInscripcion(rs.getString("indicadorInscripcion"));
                objUsuario.setIndicadorEvento(rs.getString("indicadorEvento"));
                objUsuario.setIndicadorGasto(rs.getString("indicadorGasto"));
                objUsuario.setIndicadorComision(rs.getString("indicadorComision"));
                objUsuario.setIndicadorPrograma(rs.getString("indicadorPrograma"));
                objUsuario.setIndicadorActivo(rs.getString("indicadorActivo"));
                listaUsuarios.add(objUsuario);
            }
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return listaUsuarios;
    }
    
    private static CallableStatement asignarValores(CallableStatement statement, clsEntidadUsuario objUsuario) throws SQLException{
        statement.setString("pnombres", objUsuario.getNombres());
        statement.setString("papellidos", objUsuario.getApellidos());
        statement.setString("pemail", objUsuario.getEmail());
        statement.setString("pusuario", objUsuario.getUsuario());
        statement.setString("ppassword", objUsuario.getPassword());
        statement.setString("pindicadorInscripcion", objUsuario.getIndicadorInscripcion());
        statement.setString("pindicadorEvento", objUsuario.getIndicadorEvento());
        statement.setString("pindicadorGasto", objUsuario.getIndicadorGasto());
        statement.setString("pindicadorPrograma", objUsuario.getIndicadorPrograma());
        statement.setString("pindicadorComision", objUsuario.getIndicadorComision());
        statement.setString("pindicadorUsuario", objUsuario.getIndicadorUsuario());
        statement.setString("pindicadorActivo", objUsuario.getIndicadorActivo());
        return statement;
    }
    
    
}
    
