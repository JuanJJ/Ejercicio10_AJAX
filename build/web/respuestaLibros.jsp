<%-- 
    Document   : respuestaLibros
    Created on : 06-feb-2020, 18:35:12
    Author     : Juan
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Libro"%>
<%@page import="modelo.Bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Bd bd=new Bd();
    String libro=request.getParameter("libro");
    
    List<Libro>listaLibros=bd.getLibros(libro);
    
    String json="[";
    for(int i=0;i<listaLibros.size();i++){
        json+="{titulo: \""+listaLibros.get(i).getTitulo()+"\"},";
    }
    if(listaLibros.size()!=0){
        json=json.substring(0, json.length()-1);
    }
    
    json+="]";
    out.print(json);
%>
