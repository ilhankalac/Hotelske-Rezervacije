
package Models;

import java.sql.Blob;

/**
 *
 * @author Ilhan Kalac
 */
public class Soba {
    private Integer Id;
    private String BrojSobe;
    private Blob Fotografija;
    private Integer TipSobeID;
    private Integer HotelID;
    private String Opis;
    private String KratkiOpis;
    
    public TipSobe TipSobe = new TipSobe();
    public Hotel Hotel = new Hotel();
    public Soba(){}
    
    public Soba(Integer Id, String BrojSobe, Blob Fotografija, Integer TipSobeID,
            Integer HotelID, String NazivHotelaSobe,
            String NazivTipaSobe, TipSobe TipSobe, String Opis, String KratkiOpis) {
        this.Id = Id;
        this.BrojSobe = BrojSobe;
        this.Fotografija = Fotografija;
        this.TipSobeID = TipSobeID;
        this.HotelID = HotelID;
        this.Opis = Opis;
        this.KratkiOpis = KratkiOpis;

    }
    public  void setSobaId(Integer Id){
        this.Id = Id;
    }
    public int getSobaId(){
        return  this.Id;
    }
    public void setBrojSobe(String BrojSobe) {
        this.BrojSobe = BrojSobe;
    } 
    
    public String getBrojSobe() {
        return this.BrojSobe;
    }
    
    public Blob getFotografija() {
        return this.Fotografija;
    }
    public void setFotografija(Blob Fotografija) {
        this.Fotografija = Fotografija;
    } 
    public  void setHotelID(Integer HotelID){
        this.HotelID = HotelID;
    }
    public int getHotelID(){
        return  this.HotelID;
    }
    public  void setTipSobeID(Integer TipSobeID){
        this.TipSobeID = TipSobeID;
    }
    public int getTipSobeID(){
        return  this.TipSobeID;
    }
    
    
    
    public TipSobe getTipSobe(){
        return this.TipSobe;
    }
    public void setTipSobe(TipSobe TipSobe){
        this.TipSobe = TipSobe;
    }
    public Hotel getHotel(){
        return this.Hotel;
    }
    public void setHotel(Hotel Hotel){
        this.Hotel = Hotel;
    }
    
    
    public String getOpis() {
        return this.Opis;
    }
    public void setOpis(String Opis) {
        this.Opis = Opis;
    }
    public String getKratkiOpis() {
        return this.KratkiOpis;
    }
    public void setKratkiOpis(String KratkiOpis) {
        this.KratkiOpis = KratkiOpis;
    } 
    
   
}