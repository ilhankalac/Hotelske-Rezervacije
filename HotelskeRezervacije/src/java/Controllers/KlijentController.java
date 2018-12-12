package Controllers;

import Models.Klijent;
import RepoPattern.KlijentRepo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Ilhan Kalac
 */
public class KlijentController extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            Klijent klijent = new Klijent();
            klijent.setIme(request.getParameter("Ime"));
            klijent.setPrezime(request.getParameter("Prezime"));
            klijent.setKIme(request.getParameter("KIme"));
            klijent.setSifra(request.getParameter("Lozinka"));
            klijent.setEmail(request.getParameter("Email"));
            klijent.setTelefon(request.getParameter("Telefon"));
            klijent.setAdresa(request.getParameter("Adresa"));
            klijent.setDrzava(request.getParameter("Drzava"));
            klijent.setGrad(request.getParameter("Grad"));
            klijent.setPostanskiBroj(request.getParameter("PostanskiBroj"));

            
            if(new KlijentRepo().insertKlijent(klijent)==1){
                request.setAttribute("rezultat", "True");
                request.getRequestDispatcher("Registracija.jsp").forward(request, response);
                HttpSession sesija = request.getSession();
                sesija.setAttribute("ulogovan", klijent.getKIme());
            }
            else{
                request.setAttribute("rezultat", "False");
                request.getRequestDispatcher("Registracija.jsp").forward(request, response);
            }
           
        }
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
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
