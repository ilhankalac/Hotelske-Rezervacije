
package Controllers;

import Models.Klijent;
import Models.Rezervacija;
import Models.Soba;
import RepoPattern.KlijentRepo;
import RepoPattern.RezervacijaRepo;
import RepoPattern.SobeRepo;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ilhan Kalac
 */
public class KreiranjeRezervacije extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        Rezervacija rezervacija = new Rezervacija();
        
        try {
            Soba soba = new SobeRepo().select(request.getParameter("Soba_Id"));
            Klijent klijent = new KlijentRepo().selectByUsername((String) request.getSession().getAttribute("ulogovan"));
            
            rezervacija.setDatumDolaska(request.getParameter("DatumDolaska"));
            rezervacija.setDatumOdlaska(request.getParameter("DatumOdlaska"));
            rezervacija.setNovac(soba.getCena());
            rezervacija.setBrojOdraslih(Integer.parseInt(request.getParameter("BrojOdraslih")));
            rezervacija.setBrojDece(Integer.parseInt(request.getParameter("BrojDece")));
            rezervacija.setSobaID(Integer.parseInt(request.getParameter("Soba_Id")));
            rezervacija.setVremeOdlaska(request.getParameter("VremeOdlaska"));
            rezervacija.setStatusRezervacije(false);
            rezervacija.setNovac(0);
            rezervacija.setKlijentID(klijent.getKlijentId());

            try {
                
                Cookie cookie = new Cookie("Rezervacija_Id",  new RezervacijaRepo().insert(rezervacija).toString());
                cookie.setMaxAge(1000);
                response.addCookie(cookie);
                response.sendRedirect("Placanje.jsp");
            } 
            catch (SQLException ex) {
                Logger.getLogger(KreiranjeRezervacije.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(KreiranjeRezervacije.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
