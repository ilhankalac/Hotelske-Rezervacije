
package Controllers;

import RepoPattern.HotelRepo;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Base64;
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
public class Hoteli extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Hoteli</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Hoteli at " + request.getContextPath() + "</h1>");
            
            byte byteArray[]=  new  HotelRepo().ListaHotela().get(1).getFotografija().getBytes(1, (int)  new  HotelRepo().ListaHotela().get(1).getFotografija().length());
            
            String nesto = Base64.getEncoder().encodeToString(byteArray);
           
            String svasta = new String(byteArray);
            
            out.println("<image src='data:image/jpg;base64,[" + svasta + "]'> </image>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Hoteli.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Hoteli.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
