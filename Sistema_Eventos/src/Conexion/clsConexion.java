/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
    uptapps.cloudapp.net
 */

package Conexion;
import java.sql.Connection;
import java.sql.DriverManager;
import com.mysql.jdbc.jdbc2.optional.*;
import javax.swing.*;

public class clsConexion {
    private static Connection cnx = null;
    
    public Connection getConnetion(){
        try{
            MysqlConnectionPoolDataSource ds = new MysqlConnectionPoolDataSource();
            ds.setServerName("localhost");
            ds.setPort(3306);
            ds.setDatabaseName("db_eventos");
            cnx = ds.getConnection("htrdev","12345");
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return cnx;
    
          /* try{
            MysqlConnectionPoolDataSource ds = new MysqlConnectionPoolDataSource();
            ds.setServerName("127.0.0.1");
            ds.setPort(3306);
            ds.setDatabaseName("db_eventos");
            cnx = ds.getConnection("htrdev","12345");
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return cnx;*/
    }
}
