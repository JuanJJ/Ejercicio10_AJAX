<%-- 
    Document   : respuestaLibros
    Created on : 06-feb-2020, 18:35:12
    Author     : Juan
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Libro"%>
<%@page import="modelo.Bd"%>
<%@page contentType="text/xml" pageEncoding="UTF-8"%>
<%
    Bd bd=new Bd();
    String libro=request.getParameter("libro");
    
    List<Libro>listaLibros=bd.getLibros(libro);
    
    String textoXml="<libros>";
    for(int i=0;i<listaLibros.size();i++){
        textoXml+="<titulo>"+listaLibros.get(i).getTitulo()+"</titulo>";
    }
    
    textoXml+="</libros>";
    out.print(textoXml);
%>
