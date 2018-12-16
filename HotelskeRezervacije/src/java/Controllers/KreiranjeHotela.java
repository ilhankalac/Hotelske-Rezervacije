package Controllers;

import Models.Hotel;
import RepoPattern.HotelRepo;
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
public class KreiranjeHotela extends HttpServlet {


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
        
        try{
            Hotel hotel = new  Hotel();
            hotel.setNaziv(request.getParameter("Naziv"));
            hotel.setDrzava(request.getParameter("Drzava"));
            hotel.setGrad(request.getParameter("Grad"));
            hotel.setAdresa(request.getParameter("Adresa")); 
            hotel.setBrojZvezdica(Integer.parseInt(request.getParameter("Zvezdice")));
            if(new HotelRepo().insert(hotel)){
                    response.sendRedirect("Hoteli.jsp");
            }
            else{
                response.sendRedirect("Greska.jsp");
            }
        }catch(Exception  ex){
             response.sendRedirect("Greska.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
