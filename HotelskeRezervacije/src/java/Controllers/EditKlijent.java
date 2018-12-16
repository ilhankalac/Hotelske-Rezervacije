
package Controllers;

import Models.Klijent;
import RepoPattern.KlijentRepo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Ilhan Kalac
 */
public class EditKlijent extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        try (PrintWriter out = response.getWriter()) {
            
        }
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        Klijent klijent = new Klijent();
        klijent.setKlijentId(Integer.parseInt(request.getParameter("Klijent_Id")));
        klijent.setIme(request.getParameter("Ime"));
        klijent.setPrezime(request.getParameter("Prezime"));
        klijent.setKIme(request.getParameter("KIme"));
        klijent.setEmail(request.getParameter("Email"));
        klijent.setTelefon(request.getParameter("Telefon"));
        klijent.setAdresa(request.getParameter("Adresa"));
        klijent.setDrzava(request.getParameter("Drzava"));
        klijent.setGrad(request.getParameter("Grad"));
        klijent.setRola(request.getParameter("Rola"));
        klijent.setPoeni(Double.parseDouble( request.getParameter("Poeni")));
        klijent.setHotelID(Integer.parseInt(request.getParameter("HotelID")));
        klijent.setPostanskiBroj(request.getParameter("PostanskiBroj"));

        
        if(new  KlijentRepo().update(klijent))
            response.sendRedirect("Klijenti.jsp");
        else
        {
            request.setAttribute("Klijent_Id", klijent.getKlijentId());
            request.setAttribute("rezultat", "False");
            request.getRequestDispatcher("EditKlijent.jsp").forward(request, response);
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
