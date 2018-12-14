package RepoPattern;

import Models.Klijent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
    
    public boolean logovanje(String username, String password) throws SQLException{
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(KlijentRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        String URL =  "jdbc:mysql://localhost:3306/hotelskerezervacije", USER = "root", PASS = "";
        Connection con = DriverManager.getConnection(URL, USER, PASS);
        
        String provera = "select * from Klijenti where KIme = '" + username+ "'  and Sifra = '"+ password+"'";
        
        PreparedStatement pst = con.prepareStatement(provera);        
        ResultSet rs =  pst.executeQuery(provera);
        
        while(rs.next())
            return  true;
        
        return false;
    }
    public ArrayList<Klijent> ListaKlijenata(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(KlijentRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        ArrayList<Klijent> klijenti = new ArrayList<Klijent>();
        String URL =  "jdbc:mysql://localhost:3306/hotelskerezervacije", USER = "root", PASS = "";
        try {
            Connection con = DriverManager.getConnection(URL, USER, PASS);
             String upit = "select *from klijenti";
        
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(upit);
             
             while(rs.next()){
                 Klijent klijent = new Klijent();
                 klijent.setIme(rs.getString("Ime"));
                 klijent.setPrezime(rs.getString("Prezime"));
                 klijent.setKIme(rs.getString("KIme"));
                 klijent.setEmail(rs.getString("Email"));
                 klijent.setTelefon(rs.getString("Telefon"));
                 klijent.setAdresa(rs.getString("Adresa"));
                 klijent.setGrad(rs.getString("Grad"));
                 klijent.setDrzava(rs.getString("Drzava"));
                 klijent.setVrsta(rs.getString("Vrsta"));
                 klijent.setPoeni(rs.getDouble("Poeni"));
                 klijent.setHotelID(rs.getInt("HotelID"));
                 klijent.setPostanskiBroj(rs.getString("PostanskiBroj"));
                 klijenti.add(klijent);
             }
 
        } catch (SQLException ex) {
            Logger.getLogger(KlijentRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return klijenti; 
    }
    
    
    
    
}
