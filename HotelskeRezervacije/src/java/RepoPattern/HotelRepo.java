package RepoPattern;

import Models.Hotel;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ilhan Kalac
 */
public class HotelRepo {
    
    Connection con;
    public HotelRepo() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(HotelRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String URL =  "jdbc:mysql://localhost:3306/hotelskerezervacije", USER = "root", PASS = "";
        try {
            con = DriverManager.getConnection(URL, USER, PASS);
        } catch (SQLException ex) {
            Logger.getLogger(HotelRepo.class.getName()).log(Level.SEVERE, null, ex);
        }        
    }
    
    public boolean insert(Hotel hotel){
        String insert = "INSERT INTO `hotel`( `Naziv`, `Drzava`, `Grad`, `Adresa`, `BrojZvezdica`) "
                        + "VALUES (?,?,?,?,?) ";
        try {
            PreparedStatement pst = con.prepareStatement(insert);
            
            pst.setString(1, hotel.getNaziv());
            pst.setString(2, hotel.getDrzava());
            pst.setString(3, hotel.getGrad());
            pst.setString(4, hotel.getAdresa());
            pst.setInt(5, hotel.getBrojZvezdica());
            
            
            pst.executeUpdate();
           
            return true;
        } catch (SQLException ex) {
            return false;
        }
    }

    
}
