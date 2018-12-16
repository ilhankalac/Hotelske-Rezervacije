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
    
    Connection con;
    public KlijentRepo() {
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
    
    
    
    public boolean insertKlijent(Klijent klijent){
        try {
            String insertToKlijent = "INSERT INTO `klijenti`(Ime, Prezime, KIme, Sifra, Email, Telefon,"
                    + " Adresa, Grad, Drzava, Poeni, HotelID, PostanskiBroj, RolaID)"
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
            pst.setDouble(10, 0.0);
            //prilikom registracije klijentu se po difoltu dodeljuje  prvi hotel u tabeli
            pst.setInt(11, 1);
            pst.setString(12, klijent.getPostanskiBroj());
            pst.setInt(13, 1);
            
            
           pst.executeUpdate();
           
           return true;
        } catch (SQLException e) {
          
        }
        return false;
    }
    public boolean logovanje(String username, String password){
        
        
        String provera = "select * from Klijenti where KIme = '" + username+ "'  and Sifra = '"+ password+"'";
        
        PreparedStatement pst;        
        try {
            pst = con.prepareStatement(provera);
            ResultSet rs =  pst.executeQuery(provera);
            while(rs.next())
                return  true;
        
        } catch (SQLException ex) {
            Logger.getLogger(KlijentRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
       
      
        return false;
    }
    public ArrayList<Klijent> ListaKlijenata(){
        
        ArrayList<Klijent> klijenti = new ArrayList<Klijent>();
        try {
           
             String select = "select *from klijenti";
        
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(select);
             
             while(rs.next()){
                 Klijent klijent = new Klijent();
                 klijent.setKlijentId(rs.getInt("Id"));
                 klijent.setIme(rs.getString("Ime"));
                 klijent.setPrezime(rs.getString("Prezime"));
                 klijent.setKIme(rs.getString("KIme"));
                 klijent.setEmail(rs.getString("Email"));
                 klijent.setTelefon(rs.getString("Telefon"));
                 klijent.setAdresa(rs.getString("Adresa"));
                 klijent.setGrad(rs.getString("Grad"));
                 klijent.setDrzava(rs.getString("Drzava"));
                 klijent.setRola(Integer.toString(rs.getInt("RolaID")));
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
    public void brisanje(String Id){
 
        
        try {
          
            String delete = "delete from  klijenti where id = " + Id;
            PreparedStatement ps  = con.prepareStatement(delete);

            ps.executeUpdate();
  
        } catch (SQLException ex) {
            Logger.getLogger(KlijentRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
       
    }
    public Klijent Klijent(String Id){

        Klijent klijent = new Klijent();
        try {
            String select = "select *from klijenti where id = " + Id;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(select);

            while(rs.next()){
                klijent.setKlijentId(rs.getInt("Id"));
                klijent.setIme(rs.getString("Ime"));
                klijent.setPrezime(rs.getString("Prezime"));
                klijent.setKIme(rs.getString("KIme"));
                klijent.setEmail(rs.getString("Email"));
                klijent.setTelefon(rs.getString("Telefon"));
                klijent.setAdresa(rs.getString("Adresa"));
                klijent.setGrad(rs.getString("Grad"));
                klijent.setDrzava(rs.getString("Drzava"));
                klijent.setRola(Integer.toString( rs.getInt("RolaID")));
                klijent.setPoeni(rs.getDouble("Poeni"));
                klijent.setHotelID(rs.getInt("HotelID"));
                klijent.setPostanskiBroj(rs.getString("PostanskiBroj"));
        }
        
        } catch (SQLException ex) {
            Logger.getLogger(KlijentRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
      
        return klijent;
    }
    public String Rola(String username, String password){
        
        String select = "select RolaID from klijenti where sifra = '"+ password + "' and KIme = '" + username + "'";
        Statement st;
        try {
            st = con.createStatement();
            ResultSet rs = st.executeQuery(select);

            while(rs.next())
                return rs.getString("RolaID");
            
        } catch (SQLException ex) {
            Logger.getLogger(KlijentRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Greska";
    }
    public boolean update(Klijent klijent){
        
        String update = "update klijenti "
                      + "set Ime = ?,"
                      + "Prezime = ?,"
                      + "KIme = ?,"
                      + "Email = ?,"
                      + "Telefon = ?,"
                      + "Adresa = ?,"
                      + "Drzava = ?,"
                      + "Grad = ?,"
                      + "RolaID = ?,"
                      + "Poeni = ?,"
                      + "HotelID = ?,"
                      + "PostanskiBroj = ?"
                      + " where id = ?";
         
        try {
            PreparedStatement pst = con.prepareStatement(update);

            pst.setString(1, klijent.getIme());
            pst.setString(2, klijent.getPrezime());
            pst.setString(3, klijent.getKIme());
            pst.setString(4, klijent.getEmail());
            pst.setString(5, klijent.getTelefon());
            pst.setString(6, klijent.getAdresa());
            pst.setString(7, klijent.getDrzava());
            pst.setString(8, klijent.getGrad()); 
            pst.setInt(9, Integer.parseInt(klijent.getRola()));
            pst.setDouble(10, klijent.getPoeni());
            pst.setInt(11, klijent.getHotelID());
            pst.setString(12, klijent.getPostanskiBroj());
            pst.setInt(13, klijent.getKlijentId());

            pst.executeUpdate();
            
            return true;
            
        } catch (SQLException e) {
          return false;
        }
    }
}
