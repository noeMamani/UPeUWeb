<%@page import="pe.edu.upeu.to.Empresa"%>
<%@page import="pe.edu.upeu.dao.EmpresaDAO"%>
<%
String opc=request.getParameter("opc");    
EmpresaDAO dao=new EmpresaDAO();
Empresa to=new Empresa();
out.println("Recibe Parametros");
String razonsocial=request.getParameter("razonsocial");
String descripcion=request.getParameter("descripcion");
String mision=request.getParameter("mision");
String vision=request.getParameter("vision");
String valores=request.getParameter("valores");
String logo=request.getParameter("logo");
String ruc=request.getParameter("ruc");
String telefono=request.getParameter("telefono");
String celular=request.getParameter("celular");
String correo=request.getParameter("correo");
String estado=request.getParameter("estado");
if(opc.equals("C")){
int docorganizacion=Integer.parseInt(request.getParameter("docorganizacion"));
int doctipo=Integer.parseInt(request.getParameter("doctipo"));

to.setRazonsocial(razonsocial);
to.setDescripcion(descripcion);
to.setId_organizacion(docorganizacion);  
to.setId_tipo(doctipo);
to.setMision(mision);
    
to.setVison(vision);
to.setValores(valores);
to.setLogo(logo);
    
to.setRuc(ruc);
to.setTelefono(telefono);
    
to.setCelular(celular);
    
to.setCorreo(correo);
    
to.setEstado(estado);
  
dao.crearEmpresa(to);
out.println(razonsocial+"<br>"+descripcion+"<br>"+mision
+"<br>"+vision+"<br>"+valores+"<br>"+logo
+"<br>"+ruc+"<br>"+telefono+"<br>"+celular+"<br>"+correo);
%>
<jsp:forward page="mainEmpresa.jsp" ></jsp:forward>
    
<% }else if(opc.equals("E")){ %>

<%
dao=new EmpresaDAO();
int idempresa=Integer.parseInt(request.getParameter("idempresa"));
if(dao.eliminarEmpresa(idempresa)){
%>
<jsp:forward page="mainEmpresa.jsp" ></jsp:forward>
    
<% }else{ out.print("Error en eliminar registro");
 }  

}else if(opc.equals("M")){
int docorganizacion=Integer.parseInt(request.getParameter("docorganizacion"));
int doctipo=Integer.parseInt(request.getParameter("doctipo"));
int idempresa=Integer.parseInt(request.getParameter("idempresa"));
to.setRazonsocial(razonsocial);
to.setDescripcion(descripcion);
to.setMision(mision);
to.setVison(vision);
to.setValores(valores);
to.setLogo(logo);
to.setRuc(ruc);
to.setTelefono(telefono);
to.setCelular(celular);
to.setCorreo(correo);
to.setId_empresa(idempresa);
dao.actualizarDatosEmpresa(to);    
%>
<jsp:forward page="mainEmpresa.jsp" ></jsp:forward>
<% } %>