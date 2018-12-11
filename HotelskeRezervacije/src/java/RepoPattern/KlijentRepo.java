package RepoPattern;

import Models.Klijent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Ilhan Kalac
 */
public class KlijentRepo {
    public int insertKlijent(Klijent klijent){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String URL =  "jdbc:mysql://localhost:3306/hotelskerezervacije", USER = "root", PASS = "";
            Connection con = DriverManager.getConnection(URL, USER, PASS);
            
            String insertToKlijent = "INSERT INTO `klijenti`(Ime, Prezime, KIme, Sifra, Email, Telefon,"
                    + " Adresa, Grad, Drzava, Vrsta, Poeni, HotelID, PostanskiBroj)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement pst = con.prepareStatement(insertToKlijent);
            
            pst.setString(1, klijent.getIme());
            pst.setString(2, klijent.getPrezime());
            pst.setString(3, klijent.getKIme());
            pst.setString(4, klijent.getSifra());
            pst.setString(5, klijent.getEmail());
            pst.setString(6, klijent.getTelefon());
            pst.setString(7, klijent.getAdresa());
            pst.setString(8, klijent.getGrad());
            pst.setString(9, klijent.getDrzava());
            pst.setString(10, "Nista");
            pst.setDouble(11, 0.0);
            //prilikom registracije klijentu se po difoltu dodeljuje  prvi hotel u tabeli
            pst.setInt(12, 1);
            pst.setString(13, klijent.getPostanskiBroj());
            
            
           pst.executeUpdate();
           
           return 1;
        } catch (SQLException e) {
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(KlijentRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return 0;
    }
}
