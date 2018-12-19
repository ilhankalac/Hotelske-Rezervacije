package Models;

/**
 *
 * @author Ilhan Kalac
 */
public class TipSobe {
    private Integer Id;
    private String Naziv;
    private String Opis;
    private String KratkiOpis;
    
    public TipSobe(){}
    public TipSobe(Integer Id, String Naziv, String Opis, String KratkiOpis) {
        this.Id = Id;
        this.Naziv = Naziv;
        this.Opis = Opis;
        this.KratkiOpis = KratkiOpis;
    }
    public int getTipSobeId(){
        return  this.Id;
    }
    
    public  void setTipSobeId(Integer Id){
        this.Id = Id;
    }
    public String getNaziv() {
        return this.Naziv;
    }
    public void setNaziv(String Naziv) {
        this.Naziv = Naziv;
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
