package Models;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author Ilhan Kalac
 */
public class Rezervacija {

    private Integer Id;
    private Date DatumDolaska;
    private Date DatumOdlaska;
    private Time VremeOdlaska;
    private Double Novac;
    private Integer BrojOdraslih;
    private Integer BrojDece;
    private Integer TipSobeID;
    private Integer KlijentID;
    private boolean StatusRezervacije;

    public Rezervacija(){}
    public Rezervacija(Integer Id, Date DatumDolaska, Date DatumOdlaska, Time VremeOdlaska, 
            Double Novac, Integer BrojOdraslih, Integer BrojDece, Integer TipSobeID, 
            Integer KlijentID, boolean StatusRezervacije) {
        this.Id = Id;
        this.DatumDolaska = DatumDolaska;
        this.DatumOdlaska = DatumOdlaska;
        this.VremeOdlaska = VremeOdlaska;
        this.Novac = Novac;
        this.BrojOdraslih = BrojOdraslih;
        this.BrojDece = BrojDece;
        this.StatusRezervacije = StatusRezervacije;
        this.TipSobeID = TipSobeID;
        this.KlijentID = KlijentID;
        
    }
    
    public int getRezervacijaId(){
        return  this.Id;
    }
    
    public  void setRezervacijaId(Integer Id){
        this.Id = Id;
    }
    
    public Date getDatumDolaska(){
        return this.DatumDolaska;
    }
    public void setDatumDolaska(Date DatumDolaska){
        this.DatumDolaska = DatumDolaska;
    }
    public Date getDatumOdlaska(){
        return this.DatumOdlaska;
    }
    public void setDatumOdlaska(Date DatumOdlaska){
        this.DatumOdlaska = DatumOdlaska;
    }
    public Time getVremeOdlaska(){
        return this.VremeOdlaska;
    }
    public void setVremeOdlaska(Time VremeOdlaska){
        this.VremeOdlaska = VremeOdlaska;
    }
    
    public double getNovac(){
        return this.Novac;
    }
    public void setNovac(double Novac){
        this.Novac = Novac;
    }
    public Integer getBrojOdraslih(){
        return  this.BrojOdraslih;
    }
    
    public  void setBrojOdraslih(Integer BrojOdraslih){
        this.BrojOdraslih = BrojOdraslih;
    }
    public Integer getBrojDece(){
        return  this.BrojDece;
    }
    
    public  void setBrojDece(Integer BrojDece){
        this.BrojDece = BrojDece;
    }
    
    public boolean getStatusRezervacije() {
        return this.StatusRezervacije;
    }
    public void setStatusRezervacije(boolean StatusRezervacije) {
        this.StatusRezervacije = StatusRezervacije;
    } 
    public Integer getTipSobeID(){
        return  this.TipSobeID;
    }
    
    public  void setTipSobeID(Integer TipSobeID){
        this.TipSobeID = TipSobeID;
    }
    public Integer getKlijentID(){
        return  this.KlijentID;
    }
    
    public  void setKlijentID(Integer KlijentID){
        this.KlijentID = KlijentID;
    }
}
