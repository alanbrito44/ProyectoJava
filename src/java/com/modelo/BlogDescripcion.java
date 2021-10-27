/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

/**
 *
 * @author dougl
 */
public class BlogDescripcion {

    private int idBlogDesc;
    private int idBlog;
    private String titulo;
    private String descrip;
    private String imgPortada;
    private String contenido;
    private String imgContent;

    public BlogDescripcion() {
        
    }

    public BlogDescripcion(int idBlogDesc, int idBlog, String titulo, String descrip, String imgPortada, String contenido, String imgContent) {
        this.idBlogDesc = idBlogDesc;
        this.idBlog = idBlog;
        this.titulo = titulo;
        this.descrip = descrip;
        this.imgPortada = imgPortada;
        this.contenido = contenido;
        this.imgContent = imgContent;
    }

    public String getImgContent() {
        return imgContent;
    }

    public void setImgContent(String imgContent) {
        this.imgContent = imgContent;
    }

    public int getIdBlogDesc() {
        return idBlogDesc;
    }

    public void setIdBlogDesc(int idBlogDesc) {
        this.idBlogDesc = idBlogDesc;
    }

    public int getIdBlog() {
        return idBlog;
    }

    public void setIdBlog(int idBlog) {
        this.idBlog = idBlog;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescrip() {
        return descrip;
    }

    public void setDescrip(String descrip) {
        this.descrip = descrip;
    }

    public String getImgPortada() {
        return imgPortada;
    }

    public void setImgPortada(String imgPortada) {
        this.imgPortada = imgPortada;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }


    
}