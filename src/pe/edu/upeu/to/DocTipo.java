/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.to;

/**
 *
 * @author HP
 */
public class DocTipo {
    int id_tipo;
    String nombre;
    String etiqueta;
    String estado;
    public int getId_tipo() {
        return id_tipo;
    }

    public void setId_tipo(int id_tipo) {
        this.id_tipo = id_tipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEtiqueta() {
        return etiqueta;
    }

    public void setEtiqueta(String etiqueta) {
        this.etiqueta = etiqueta;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
   
}
