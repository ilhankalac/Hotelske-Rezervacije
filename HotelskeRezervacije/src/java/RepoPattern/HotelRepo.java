package RepoPattern;

import Models.Hotel;
import Models.Klijent;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

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
    
    public boolean insert(Hotel hotel, Part part) throws SQLException{
        String insert = "INSERT INTO `hotel`( `Naziv`, `Drzava`, `Grad`, `Adresa`, `BrojZvezdica`, Fotografija, Opis) "
                        + "VALUES (?,?,?,?,?,?,?) ";
        try {
            PreparedStatement pst = con.prepareStatement(insert);
            
            pst.setString(1, hotel.getNaziv());
            pst.setString(2, hotel.getDrzava());
            pst.setString(3, hotel.getGrad());
            pst.setString(4, hotel.getAdresa());
            pst.setInt(5, hotel.getBrojZvezdica());
            
            InputStream is = part.getInputStream();
            pst.setBlob(6,is);
            pst.setString(7, hotel.getOpis());
            
            
            pst.executeUpdate();
           
            return true;
        } catch (SQLException ex) {
            return false;
        } catch (IOException ex) {
           
            Logger.getLogger(HotelRepo.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        finally{
            con.close();
        }
    }
    public ArrayList<Hotel> lista() throws SQLException{
        
        ArrayList<Hotel> hoteli = new ArrayList<Hotel>();
        try {
           
             String select = "select *from hotel";
        
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(select);
             
             while(rs.next()){
                 Hotel hotel = new Hotel();
                 hotel.setHotelId(rs.getInt("Id"));
                 hotel.setNaziv(rs.getString("Naziv"));
                 hotel.setAdresa(rs.getString("Adresa"));
                 hotel.setGrad(rs.getString("Grad"));
                 hotel.setDrzava(rs.getString("Drzava"));
                 hotel.setBrojZvezdica(rs.getInt("BrojZvezdica"));
                 hotel.setFotografija(rs.getBlob("Fotografija"));
                 hotel.setOpis(rs.getString("Opis"));
                 hoteli.add(hotel);
             }
             
        } catch (SQLException ex) {
            Logger.getLogger(HotelRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            con.close();
        }
        
        
        return hoteli; 
    }
    public void fotografije(HttpServletRequest request, HttpServletResponse response, String HotelID)throws ServletException, IOException {
        
            Statement stmt;
            try {

                stmt = con.createStatement();
                byte[] imgData = null;
                ResultSet rs = stmt.executeQuery("select fotografija from hotel where id = " + HotelID);
                while (rs.next()) 
                {
                    Blob image = rs.getBlob(1);
                    imgData = image.getBytes(1,(int)image.length());
                }
                response.setContentType("image/jpg");
                try (OutputStream o = response.getOutputStream()) {
                    o.write(imgData);
                    o.flush();
                }
            } catch (SQLException ex) {

            }
    }
    public Hotel select(String Id) throws SQLException{
        Hotel hotel = new Hotel();
        try {
            String select = "select *from hotel where id = " + Id;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(select);

            while(rs.next()){
                hotel.setHotelId(rs.getInt("Id"));
                hotel.setNaziv(rs.getString("Naziv"));
                hotel.setDrzava(rs.getString("Drzava"));
                hotel.setGrad(rs.getString("Grad"));
                hotel.setAdresa(rs.getString("Adresa"));
                hotel.setBrojZvezdica(rs.getInt("BrojZvezdica"));
                hotel.setFotografija(rs.getBlob("Fotografija"));
            }
        } catch (SQLException ex) {
           Logger.getLogger(HotelRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            con.close();
        }
        return hotel;
    }
    
}
