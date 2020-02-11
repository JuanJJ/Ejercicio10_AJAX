<%-- 
    Document   : informacionLibros
    Created on : 11-feb-2020, 8:32:04
    Author     : Alumno_2DAW
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Libro"%>
<%@page import="modelo.Bd"%>
<%@page contentType="text/xml" pageEncoding="UTF-8"%>
<%
    Bd bd=new Bd();
    String libro=request.getParameter("libro");
    
    List<Libro>listaLibros=bd.getInformacionLibro(libro);
    
    String textoXml="<libros>";
    for(int i=0;i<listaLibros.size();i++){
        textoXml+="<titulo>"+listaLibros.get(i).getTitulo()+"</titulo>";
        textoXml+="<autor>"+listaLibros.get(i).getAutor()+"</autor>";
        textoXml+="<isbn>"+listaLibros.get(i).getIsbn()+"</isbn>";
        textoXml+="<descripcion>"+listaLibros.get(i).getDescripcion()+"</descripcion>";
        textoXml+="<editorial>"+listaLibros.get(i).getEditorial()+"</editorial>";
    }
    
    textoXml+="</libros>";
    out.print(textoXml);
%>

