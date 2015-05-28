/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import pe.edu.upeu.to.DocOrganizacion;
import pe.edu.upeu.to.DocTipo;
import pe.edu.upeu.to.Empresa;
import pe.edu.upeu.to.Personas;
import pe.edu.upeu.util.DBconn;

/**
 *
 * @author HP
 */
public class EmpresaDAO extends DBconn {

    public ArrayList reportarEmpresa() {
        ArrayList<Empresa> data = new ArrayList();
        Empresa empresa;
        try {
            sql = "SELECT * FROM corp_empresa ";//escribiendo la consulta 
            try {
                conexionDB();//conexion a base de datos
            } catch (SQLException ex) {
                Logger.getLogger(EmpresaDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            ps = con.prepareStatement(sql);//preparando la consulta
            rs = ps.executeQuery();//Ejecutando la consulta y almacena los resultados en rs
            while (rs.next()) {
                empresa = new Empresa();
                empresa.setId_empresa(rs.getInt("id_empresa"));
                empresa.setRazonsocial(rs.getString("razonsocial"));
                empresa.setDescripcion(rs.getString("descripcion"));
                empresa.setId_organizacion(rs.getInt("id_organizacion"));
                //empresa.setId_tipo(rs.getInt("id_tipo"));
                empresa.setMision(rs.getString("mision"));
                empresa.setVison(rs.getString("vision"));
                empresa.setValores(rs.getString("valores"));
                empresa.setLogo(rs.getString("logo"));
                empresa.setRuc(rs.getString("ruc"));
                empresa.setTelefono(rs.getString("telefono"));
                empresa.setCorreo(rs.getString("correo"));
                empresa.setEstado(rs.getString("estado"));
                data.add(empresa);
                // System.out.println("Nombre: "+rs.getString("nombre")+"\t id: "+rs.getInt("id")+"\tCelular: "+rs.getString("celular"));                
            }
        } catch (Exception e) {
            System.out.println("Error al Reportar: " + e.getMessage());
        } finally {
            cerrarConexionDB();
        }
        return data;
    }

    public ArrayList reportarDocOrganizacion() {
        ArrayList<DocOrganizacion> data = new ArrayList();
        DocOrganizacion docO;
        try {
            sql = "SELECT * FROM corp_organizacion WHERE estado='1' ";//escribiendo la consulta 
            conexionDB();//conexion a base de datos
            ps = con.prepareStatement(sql);//preparando la consulta
            rs = ps.executeQuery();//Ejecutando la consulta y almacena los resultados en rs
            while (rs.next()) {
                docO = new DocOrganizacion();
                docO.setId_organizacion(rs.getInt("id_organizacion"));
                docO.setNombre_organizacion(rs.getString("nombre_organizacion"));
                docO.setDescripcion(rs.getString("descripcion"));
                docO.setMision(rs.getString("mison"));
                docO.setVision(rs.getString("vison"));
                docO.setValores(rs.getString("valores"));
                docO.setLogo(rs.getString("logo"));
                docO.setRuc(rs.getString("ruc"));
                docO.setTelefono(rs.getString("telefono"));

                docO.setCelular(rs.getString("celular"));
                docO.setCorreo(rs.getString("correo"));
                docO.setEstado(rs.getString("estado"));
                data.add(docO);
                // System.out.println("Nombre: "+rs.getString("nombre")+"\t id: "+rs.getInt("id")+"\tCelular: "+rs.getString("celular"));                
            }
        } catch (SQLException e) {
            System.out.println("Error al Reportar: " + e.getMessage());
        } finally {
            cerrarConexionDB();
        }
        return data;
    }

    public ArrayList reportarDocTipo() {
        ArrayList<DocTipo> data = new ArrayList();
        DocTipo doci;
        try {
            sql = "SELECT * FROM corp_tipo WHERE estado='1' ";//escribiendo la consulta 
            conexionDB();//conexion a base de datos
            ps = con.prepareStatement(sql);//preparando la consulta
            rs = ps.executeQuery();//Ejecutando la consulta y almacena los resultados en rs
            while (rs.next()) {
                doci = new DocTipo();
                doci.setId_tipo(rs.getInt("id_tipo"));
                doci.setNombre(rs.getString("nombre"));
                doci.setEtiqueta(rs.getString("etiqueta"));
                doci.setEstado(rs.getString("estado"));
                data.add(doci);
                System.out.println("siii entraaaaaa");
                //System.out.println("Nombre: "+rs.getString("nombre")+"\t id: "+rs.getInt("id")+"\tCelular: "+rs.getString("estado"));                
            }
        } catch (SQLException e) {
            System.out.println("Error al Reportarrrrrrrr: " + e.getMessage());
        } finally {
            cerrarConexionDB();
        }
        return data;
    }

    public boolean eliminarEmpresa(int idEmpresa) {
        boolean resultado = false;
        try {
            sql = " DELETE FROM corp_empresa WHERE id_empresa = ? ";
            conexionDB();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idEmpresa);
            if (ps.execute() == false) {
                resultado = true;
                System.out.println("Ingreso");
            } else {
                resultado = false;
            }

        } catch (SQLException e) {
            System.out.println("Error al eliminar:" + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al eliminar:" + e.getMessage());
        } finally {
            cerrarConexionDB();
        }

        return resultado;
    }
public void crearEmpresa(Empresa emp){
        int i=0;
        try {
            sql="insert into corp_empresa( "
            + "razonsocial,descripcion, "
            + "id_organizacion,id_tipo,"
            + "mision, vision,valores,logo, "
            + "ruc,telefono, celular, correo, estado)"
            + " values( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";            
            conexionDB();//conexion a base de datos
            ps=con.prepareStatement(sql);
            ps.setString(++i, emp.getRazonsocial());
            ps.setString(++i, emp.getDescripcion());
            ps.setInt(++i, emp.getId_organizacion());
            ps.setInt(++i, emp.getId_tipo());
            ps.setString(++i, emp.getMision());
            ps.setString(++i, emp.getVison());
            ps.setString(++i, emp.getValores());
            ps.setString(++i, emp.getLogo());
            ps.setString(++i, emp.getRuc());
            ps.setString(++i, emp.getTelefono());
            ps.setString(++i, emp.getCelular());
            ps.setString(++i, emp.getCorreo());
            ps.setString(++i, emp.getEstado());
            ps.executeUpdate();    
            System.out.println("siiiiiiiiiiiiiiiiiiiiiii");
        } catch (Exception e) {
            System.out.println("Error al Insertar:"+e.getMessage());
        }
        finally{cerrarConexionDB();}
    }
    public ArrayList buscarPersona(String dato) {
        ArrayList data = new ArrayList();
        Personas to;
        try {
            sql = " SELECT * FROM corp_empresa WHERE UPPER(CONCAT(nombre,' ',apellido_pat,' ',apellido_mat,' ',usuario)) LIKE UPPER(?) ";
            conexionDB();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + dato + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                to = new Personas();
                to.setId_persona(rs.getInt("id_persona"));
                to.setId_docidentidad(rs.getInt("id_docidentidad"));
                to.setNombre(rs.getString("nombre"));
                to.setApellido_pat(rs.getString("apellido_pat"));
                to.setApellido_mat(rs.getString("apellido_mat"));
                to.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
                to.setGenero(rs.getString("genero"));
                to.setCorreo(rs.getString("correo"));
                to.setUsuario(rs.getString("usuario"));
                data.add(to);
            }
        } catch (SQLException e) {
            System.out.println("Error al reporta:" + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al reporta:" + e.getMessage());
        } finally {
            cerrarConexionDB();
        }
        return data;
    }

    public Empresa buscarEmpresaId(int idempresa) {

        Empresa to = null;
        try {
            sql = " SELECT * FROM corp_empresa WHERE id_empresa=? ";
            conexionDB();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idempresa);
            rs = ps.executeQuery();
            if (rs.next()) {
                to = new Empresa();
                to.setId_empresa(rs.getInt("id_empresa"));
                to.setRazonsocial(rs.getString("razonsocial"));
                to.setDescripcion(rs.getString("descripcion"));
                to.setMision(rs.getString("mision"));
                to.setVison(rs.getString("vision"));
                to.setValores(rs.getString("valores"));
                to.setLogo(rs.getString("logo"));
                to.setRuc(rs.getString("ruc"));
                to.setTelefono(rs.getString("telefono"));
                to.setCelular(rs.getString("celular"));
                to.setCorreo(rs.getString("correo"));
                to.setEstado(rs.getString("estado"));
            

            }
        } catch (SQLException e) {
            System.out.println("Error al reporta:" + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al reporta:" + e.getMessage());
        } finally {
            cerrarConexionDB();
        }
        return to;
    }

    public boolean actualizarDatosEmpresa(Empresa emp) {
        int i = 0;
        try {
            sql = "UPDATE corp_empresa SET  razonsocial =? , descripcion = ? , id_organizacion = ? , id_tipo = ? , mision = ?, vision= ? , valores = ? , logo = ?, ruc = ?, telefono = ? , celular =? , correo = ?, estado =? WHERE id_empresa = ?; ;";
            conexionDB();//conexion a base de datos
            ps = con.prepareStatement(sql);
            ps.setString(++i, emp.getRazonsocial());
            ps.setString(++i, emp.getDescripcion());
            ps.setInt(++i, emp.getId_organizacion());
            ps.setInt(++i, emp.getId_tipo());
            ps.setString(++i, emp.getMision());
            ps.setString(++i, emp.getVison());
            ps.setString(++i, emp.getValores());
            ps.setString(++i, emp.getLogo());
            ps.setString(++i, emp.getRuc());
            ps.setString(++i, emp.getTelefono());
            ps.setString(++i, emp.getCelular());
            ps.setString(++i, emp.getCorreo());
            ps.setString(++i, emp.getEstado());
            ps.setInt(++i, emp.getId_empresa());
            System.out.println("siiiii esta ejecutando la consultaaa");
            if (ps.executeUpdate() == 1) {
                return true;
            }

        } catch (SQLException e) {
            System.out.println("Error al Actualizarrrrrrr:" + e.getMessage());
        } finally {
            cerrarConexionDB();
        }
        return false;
    }
}
