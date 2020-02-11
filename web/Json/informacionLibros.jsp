<%-- 
    Document   : informacionLibros
    Created on : 11-feb-2020, 8:32:04
    Author     : Alumno_2DAW
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Libro"%>
<%@page import="modelo.Bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Bd bd=new Bd();
    String libro=request.getParameter("libro");
    
    List<Libro>listaLibros=bd.getInformacionLibro(libro);
    
    String json="[";
    for(int i=0;i<listaLibros.size();i++){
        String descripcion=listaLibros.get(i).getDescripcion().replace('\"', '\'');
        json+="{titulo: \""+listaLibros.get(i).getTitulo()+"\","
                + "autor: \""+listaLibros.get(i).getAutor()+"\","
                + "isbn: \""+listaLibros.get(i).getIsbn()+"\","
                + "descripcion: \""+descripcion+"\","
                + "editorial: \""+listaLibros.get(i).getEditorial()+"\"},";
    }
    if(listaLibros.size()!=0){
        json=json.substring(0, json.length()-1);
    }
    
    json+="]";
    out.print(json);
%>

