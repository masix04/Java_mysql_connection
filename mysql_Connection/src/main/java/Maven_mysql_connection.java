
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author muhammad.ahmed
 */
public class Maven_mysql_connection {
    public static void main(String[] args) {
        String url = "jdbc:mysql://127.0.0.1:3310/javabase";
        String username = "root";
        String password = "Root0)00";
        
        try {
            Connection conn = DriverManager.getConnection(url, username, password);
            System.out.println("  ********************************");
            System.out.println("  Balley Balley!");
            System.out.println("   --- MAVEN TYPE PROJECT.");
            System.out.println("  Connected to Database");
            System.out.println("  ********************************");
        } catch (SQLException ex) {
            System.out.println("!! error !!");
            Logger.getLogger(Maven_mysql_connection.class.getName()).log(Level.SEVERE, null, ex);
        };
    }
}
