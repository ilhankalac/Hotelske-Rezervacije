package Models;

/**
 *
 * @author Ilhan Kalac
 */
public class TipSobe {
    private Integer Id;
    private String Naziv;
    
    
    public TipSobe(){}
    public TipSobe(Integer Id, String Naziv) {
        this.Id = Id;
        this.Naziv = Naziv;
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
    
   
    
}
