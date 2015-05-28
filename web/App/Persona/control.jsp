<%@page import="pe.edu.upeu.to.Personas"%>
<%@page import="pe.edu.upeu.dao.PersonaDAO"%>
<%
String opc=request.getParameter("opc");    
PersonaDAO dao=new PersonaDAO();
Personas to=new Personas();
out.println("Recibe Parametros");
String nombre=request.getParameter("nombre");
String apaterno=request.getParameter("apellpaterno");
String amaterno=request.getParameter("apellmaterno");
String fnacimiento=request.getParameter("fnacimiento");
String genero=request.getParameter("genero");
String correo=request.getParameter("correo");
String estado=request.getParameter("estado");
String usuario=request.getParameter("usuario");
String clave=request.getParameter("clave");

if(opc.equals("C")){
int docidentidad=Integer.parseInt(request.getParameter("docidentidad"));

to.setNombre(nombre);
to.setId_docidentidad(docidentidad);
to.setApellido_pat(apaterno);
to.setApellido_mat(amaterno);
to.setFecha_nacimiento(fnacimiento);
to.setGenero(genero);
to.setCorreo(correo);
to.setUsuario(usuario);
to.setClave(clave);
dao.crearPersona(to);
out.println(nombre+"<br>"+apaterno+"<br>"+amaterno
+"<br>"+fnacimiento+"<br>"+genero+"<br>"+estado
+"<br>"+correo+"<br>"+usuario+"<br>"+clave);
%>
<jsp:forward page="main.jsp" ></jsp:forward>
    
<% }else if(opc.equals("E")){ %>

<%
dao=new PersonaDAO();
int idpersona=Integer.parseInt(request.getParameter("idpersona"));
if(dao.eliminarPersona(idpersona)){
%>
<jsp:forward page="main.jsp" ></jsp:forward>
    
<% }else{ out.print("Error en eliminar registro");
 }  

}else if(opc.equals("M")){
int docidentidad=Integer.parseInt(request.getParameter("docidentidad"));
int idpersona=Integer.parseInt(request.getParameter("idpersona"));
to.setNombre(nombre);
to.setId_docidentidad(docidentidad);
to.setApellido_pat(apaterno);
to.setApellido_mat(amaterno);
to.setFecha_nacimiento(fnacimiento);
to.setGenero(genero);
to.setCorreo(correo);
to.setClave(clave);
to.setId_persona(idpersona);
dao.actualizarDatosPersona(to);    
%>
<jsp:forward page="main.jsp" ></jsp:forward>
<% } %>