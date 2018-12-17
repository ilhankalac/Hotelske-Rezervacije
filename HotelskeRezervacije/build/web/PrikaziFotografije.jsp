<%-- 
    Document   : PrikazSlike
    Created on : 17-Dec-2018, 19:33:46
    Author     : Ilhan Kalac
--%>


<%@page import="RepoPattern.HotelRepo"%>
<% new HotelRepo().fotografije(request, response, request.getParameter("hotelID")); %>
