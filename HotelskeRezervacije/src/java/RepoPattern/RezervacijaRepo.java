
package RepoPattern;

import Models.Rezervacija;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Ilhan Kalac
 */
public class RezervacijaRepo {
    Connection con;
    public RezervacijaRepo() {
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
    public Integer insert(Rezervacija rezervacija) throws SQLException{
        Integer LastID = 0;
        String insert = "INSERT INTO `Rezervacije`( `DatumDolaska`, `DatumOdlaska`, `Novac`, "
                + "`BrojOdraslih`, `BrojDece`, `SobaID`, `KlijentID`, `VremeOdlaska`, `StatusRezervacije`)"
                + " VALUES (?,?,?,?,?,?,?,?,?)";
        try {
           
            PreparedStatement pst = con.prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
            
            pst.setString(1,rezervacija.getDatumDolaska());
            pst.setString(2,rezervacija.getDatumOdlaska());
            pst.setDouble(3, rezervacija.getNovac());
            pst.setInt(4, rezervacija.getBrojOdraslih());
            pst.setInt(5, rezervacija.getBrojDece());
            pst.setInt(6, rezervacija.getSobaID());
            pst.setInt(7, rezervacija.getKlijentID());
            pst.setString(8, rezervacija.getVremeOdlaska());
            pst.setBoolean(9, rezervacija.getStatusRezervacije());

            pst.executeUpdate();

            //sa ovim se uzima ID poslednjeg inserta u tabeli rezervacije
            ResultSet rs = pst.getGeneratedKeys();

            while(rs.next())
                LastID  = rs.getInt(1);
            
           
            return LastID;
        } catch (SQLException ex) {
            return 0;
        }
        finally{
            con.close();
        }
    }
    public boolean  updateStatusRezervacije(String Id) throws SQLException{
         String update = "update rezervacije  set StatusRezervacije = 1 where Id = ?";
          try {
            PreparedStatement pst = con.prepareStatement(update);
            pst.setString(1, Id);
            
            
            pst.executeUpdate();
            return true;
          } catch (SQLException e) {
          return false;
        }
    }
    public ArrayList<Rezervacija>  aktivneRezervacije(String Id){
        
        String upit = "select Id, datumOdlaska, datumDolaska, VremeOdlaska, StatusRezervacije from  rezervacije "
                    + "where StatusRezervacije = 1 and datumDolaska > now() and sobaId = "+Id;
        ArrayList<Rezervacija> rezervacije = new ArrayList<>();
        Statement st;
        try {
            
            st = con.createStatement();
            ResultSet rs = st.executeQuery(upit);
            
            while(rs.next()){
                Rezervacija  rezervacija = new Rezervacija();
                rezervacija.setRezervacijaId(rs.getInt("Id"));
                rezervacija.setDatumOdlaska(rs.getString("datumOdlaska"));
                rezervacija.setDatumDolaska(rs.getString("datumDolaska"));
                rezervacija.setVremeOdlaska(rs.getString("VremeOdlaska"));
                rezervacija.setStatusRezervacije(rs.getBoolean("StatusRezervacije"));
                rezervacije.add(rezervacija);
             }
        
        } catch (SQLException ex) {
            Logger.getLogger(RezervacijaRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rezervacije;
    }
}
