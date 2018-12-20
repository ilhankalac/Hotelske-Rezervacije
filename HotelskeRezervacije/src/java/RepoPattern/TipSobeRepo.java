package RepoPattern;

import Models.TipSobe;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Ilhan Kalac
 */
public class TipSobeRepo {

     Connection con;
    public TipSobeRepo() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TipSobeRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String URL =  "jdbc:mysql://localhost:3306/hotelskerezervacije", USER = "root", PASS = "";
        try {
            con = DriverManager.getConnection(URL, USER, PASS);
        } catch (SQLException ex) {
            Logger.getLogger(TipSobeRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
    public ArrayList<TipSobe> lista(String HotelID) throws SQLException{
        
        ArrayList<TipSobe> tipoviSoba = new ArrayList<TipSobe>();
        try {
           
             String select = "select *from TipSobe where HotelID = " + HotelID;
        
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(select);
             
             while(rs.next()){
                 TipSobe tipSobe = new TipSobe();
                 tipSobe.setTipSobeId(rs.getInt("Id"));
                 tipSobe.setNaziv(rs.getString("Naziv"));
                 tipSobe.SetHotelID(rs.getInt("HotelID"));
                 tipoviSoba.add(tipSobe);
             }
 
        } catch (SQLException ex) {
            Logger.getLogger(TipSobeRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            con.close();
        }
        return tipoviSoba; 
    }
    
    
    
    
}
