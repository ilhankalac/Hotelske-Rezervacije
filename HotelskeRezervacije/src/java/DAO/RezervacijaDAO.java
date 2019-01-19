package DAO;

import Models.Datumi;
import Models.Rezervacija;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Ilhan Kalac
 */
public interface RezervacijaDAO {
    
    Integer insert(Rezervacija rezervacija) throws SQLException;
    long brojDana(Rezervacija rezervacija);
    boolean  updateStatusRezervacije(String Id, String NaplacivanjeNovcem) throws SQLException;
    ArrayList<Rezervacija>  aktivneRezervacije(String Id) throws SQLException;
    boolean  dostupna(Rezervacija rezervacija) throws SQLException;
    boolean logickiUnosDatuma(Rezervacija rezervacija);
    ArrayList<Datumi> listaRezervisanihDatuma(Rezervacija rezervacija) throws SQLException;
    boolean proveraDostupnihTermina(Rezervacija rezervacija, ArrayList<Datumi> listaRezervisanihDatuma);
    ArrayList<Rezervacija> lista() throws SQLException;
    boolean brisanje(String Id, Double Novac, Double Poeni) throws SQLException;
    boolean aktivnaRezervacija(Integer Id) throws SQLException;
    boolean isteklaRezervacija(Integer Id) throws SQLException;
    ArrayList<Rezervacija> rezervacijeMenadzerovihHotela(Integer MenadzerId) throws SQLException;
    
}
