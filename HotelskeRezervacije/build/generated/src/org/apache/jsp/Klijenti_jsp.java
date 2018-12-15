package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import RepoPattern.KlijentRepo;
import Models.Klijent;

public final class Klijenti_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>JSP Page</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    <style>\r\n");
      out.write("        .table-hover thead tr:hover th, .table-hover tbody tr:hover td {\r\n");
      out.write("            color: black;\r\n");
      out.write("            background-color: lightgrey;\r\n");
      out.write("        \r\n");
      out.write("        }\r\n");
      out.write("      \r\n");
      out.write("    </style>\r\n");
      out.write("    <body>\r\n");
      out.write("          \r\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "navbar.jsp", out, false);
      out.write("  \r\n");
      out.write("        <div style=\"padding-left:10%; padding-right: 10%;\">\r\n");
      out.write("        <table class=\"table table-hover table-dark\" style=\"background-color: #32383e; color:white;  font-family: Roboto;\">\r\n");
      out.write("         <thead>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                      <th scope=\"col\">#</th>\r\n");
      out.write("                      <th scope=\"col\">Ime</th>\r\n");
      out.write("                      <th scope=\"col\">Prezime</th>\r\n");
      out.write("                      <th scope=\"col\">Korisničko ime</th>\r\n");
      out.write("                      <th scope=\"col\">E-mail</th>\r\n");
      out.write("                      <th scope=\"col\">Telefon</th>\r\n");
      out.write("                      <th scope=\"col\">Adresa</th>\r\n");
      out.write("                      <th scope=\"col\">Država</th>\r\n");
      out.write("                      <th scope=\"col\">Grad</th>\r\n");
      out.write("                      <th scope=\"col\">Rola</th>\r\n");
      out.write("                      <th scope=\"col\">Poeni</th>\r\n");
      out.write("                      <th scope=\"col\">HotelID</th>\r\n");
      out.write("                      <th scope=\"col\">Postanski Broj</th>\r\n");
      out.write("                      <th scope=\"col\">Opcije</th>\r\n");
      out.write("                    </tr>\r\n");
      out.write("         </thead>\r\n");
      out.write("         <tbody>\r\n");
      out.write("         ");

             int  i = 1;
             for(Klijent klijent: new KlijentRepo().ListaKlijenata()){ { 
      out.write("\r\n");
      out.write("\r\n");
      out.write("                    <tr>\r\n");
      out.write("                      <td> ");
      out.print( i++ );
      out.write(" </td>\r\n");
      out.write("                      <td>");
      out.print(klijent.getIme() );
      out.write(" </td>\r\n");
      out.write("                      <td>");
      out.print(klijent.getPrezime());
      out.write(" </td>\r\n");
      out.write("                      <td>");
      out.print(klijent.getKIme());
      out.write(" </td>\r\n");
      out.write("                      <td>");
      out.print(klijent.getEmail());
      out.write(" </td>\r\n");
      out.write("                      <td>");
      out.print(klijent.getTelefon());
      out.write(" </td>\r\n");
      out.write("                      <td>");
      out.print(klijent.getAdresa());
      out.write(" </td>\r\n");
      out.write("                      <td>");
      out.print(klijent.getDrzava());
      out.write(" </td>\r\n");
      out.write("                      <td>");
      out.print(klijent.getGrad());
      out.write(" </td>\r\n");
      out.write("                      <td>");
      out.print(klijent.getVrsta());
      out.write(" </td>\r\n");
      out.write("                      <td>");
      out.print(klijent.getPoeni());
      out.write(" </td>\r\n");
      out.write("                      <td>");
      out.print(klijent.getHotelID());
      out.write(" </td>\r\n");
      out.write("                      <td>");
      out.print(klijent.getPostanskiBroj());
      out.write(" </td>\r\n");
      out.write("                      <td> \r\n");
      out.write("                         <a class=\"delete_link\"\r\n");
      out.write("                                    href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/Klijenti?Klijent_Id=");
      out.print( klijent.getKlijentId());
      out.write("\" >\r\n");
      out.write("                                   <i class=\"fa fa-trash\"> Obriši</i>\r\n");
      out.write("                                   \r\n");
      out.write("                         </a>\r\n");
      out.write("                      \r\n");
      out.write("                      </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                 \r\n");
      out.write("             ");
}
             }
             
             
      out.write("\r\n");
      out.write("          </tbody>\r\n");
      out.write("         </table>\r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
