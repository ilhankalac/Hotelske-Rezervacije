package Controllers;


import RepoPattern.RezervacijaRepo;

import java.io.IOException;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Ilhan Kalac
 */

public class BrisanjeRezervacije extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            
            
            if(new RezervacijaRepo().brisanje(request.getParameter("Rezervacije_Id"))){
                request.setAttribute("rezultat", "true");
                request.getRequestDispatcher("Rezervacije.jsp").forward(request, response);
            }
            else{
                 request.setAttribute("rezultat", "false");
                request.getRequestDispatcher("Rezervacije.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BrisanjeRezervacije.class.getName()).log(Level.SEVERE, null, ex);
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
