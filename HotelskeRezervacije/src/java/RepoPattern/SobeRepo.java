package RepoPattern;

import Models.Hotel;
import Models.Soba;
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
public class SobeRepo {

    Connection con;
    public SobeRepo() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(KlijentRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String URL =  "jdbc:mysql://localhost:3306/hotelskerezervacije", USER = "root", PASS = "";
        try {
            con = DriverManager.getConnection(URL, USER, PASS);
        } catch (SQLException ex) {
            Logger.getLogger(KlijentRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public ArrayList<Soba> lista() throws SQLException{
        
        ArrayList<Soba> sobe = new ArrayList<Soba>();
        try {
           
             String select = "select s.Id,s.TipSobeID, s.HotelID, s.BrojSobe, s.Fotografija,"
                     + " h.Naziv as 'NazivHotela', ts.Naziv as 'NazivTipaSobe', ts.KratkiOpis as 'KratkiOpis' "
                            + "from Sobe s "
                            + "join TipSobe ts on s.TipSobeID = ts.id "
                            + "join Hotel h on h.Id = s.HotelID";

             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(select);

             while(rs.next()){
                 Soba soba = new Soba();
                 soba.setSobaId(rs.getInt("Id"));
                 soba.setBrojSobe(rs.getString("BrojSobe"));
                 soba.setTipSobeID(Integer.parseInt(rs.getString("TipSobeID")));
                 soba.setHotelID(Integer.parseInt(rs.getString("HotelID")));
                 soba.setFotografija(rs.getBlob("Fotografija"));
                 
                 soba.Hotel.setNaziv(rs.getString("NazivHotela"));
                 
                 soba.TipSobe.setNaziv(rs.getString("NazivTipaSobe"));
                 soba.TipSobe.setKratkiOpis(rs.getString("KratkiOpis"));
                 sobe.add(soba);
             }
             
        } catch (SQLException ex) {
            Logger.getLogger(SobeRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            con.close();
        }
        return sobe; 
    }
}
