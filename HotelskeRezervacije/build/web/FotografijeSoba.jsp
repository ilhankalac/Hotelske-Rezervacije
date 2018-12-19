<%-- 
    Document   : FotografijeSoba
    Created on : 19-Dec-2018, 23:39:53
    Author     : Ilhan Kalac
--%>
<%@page import="RepoPattern.SobeRepo"%>
<% new SobeRepo().fotografije(request, response, request.getParameter("SobaId")); %>