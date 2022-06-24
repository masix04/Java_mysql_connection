/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mysql_connection_2;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author muhammad.ahmed
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
//         String url = "jdbc:mysql://127.0.0.1:3310/javabase";
         String url = "jdbc:mysql://127.0.0.1:3306/cric";

        String username = "root";
        String password = "";
        
        try {
            Connection conn = DriverManager.getConnection(url, username, password);
//            Connection conn = DriverManager.getConnection(url);

            System.out.println("  ********************************");
            System.out.println("  Balley Balley!");
            System.out.println("   --- GRADLE TYPE PROJECT.");
            System.out.println("  Connected to Database");
            System.out.println("  ********************************");
        } catch (SQLException ex) {
             System.out.println("!! error!!");
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
