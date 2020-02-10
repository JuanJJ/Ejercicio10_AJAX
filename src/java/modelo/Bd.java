/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Juan
 */
public class Bd {
    private final static String drv="com.mysql.jdbc.Driver";
    private final static String db="jdbc:mysql://localhost:3306/books?useSSL=false";
    private final static String user="root";
    private Connection cn;
    private ResultSet rs;
    private PreparedStatement pst;

    public Bd() throws ClassNotFoundException, SQLException {
        abrirConexion();
        
    }

    public void abrirConexion() throws ClassNotFoundException, SQLException {
        Class.forName(drv);
        cn=DriverManager.getConnection(db,user,"");
        System.out.println("La conexion se realizo con exito");
    }
    
    public void cerrarConexion() throws SQLException{
        if(rs!=null){
            rs.close();
        }
        if (pst!=null) {
            pst.close();
        }
        if (cn!=null) {
            cn.close();
        }
        
        System.out.println("Conexion cerrada");
    }
    
    public List<Libro> getLibros(String libro) throws SQLException{
        List<Libro>lista=new ArrayList<>();
        //con el datalist no hace falta hacer una busqueda con la variable
        //al sacar todos los libros con el datalist los filtra solo
        String sql="SELECT Titulo FROM `titulos` WHERE Titulo LIKE '"+libro+"%'";
        pst=cn.prepareStatement(sql);
        rs=pst.executeQuery();
        
        while (rs.next()) {            
            String titulo=rs.getString(1);
            Libro lib=new Libro(titulo);
            lista.add(lib);
        }
        return lista;
    }
}
