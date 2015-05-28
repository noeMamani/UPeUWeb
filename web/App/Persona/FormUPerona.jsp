<%-- 
    Document   : FormPersona
    Created on : 28-abr-2015, 12:30:27
    Author     : SistemasUpeu
--%>

<%@page import="pe.edu.upeu.to.Personas"%>
<%@page import="pe.edu.upeu.to.DocIdentidad"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pe.edu.upeu.dao.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../../includesHead.jsp" %>

<%
    PersonaDAO dao=null;
    dao=new PersonaDAO();
    ArrayList<DocIdentidad> doc=null;
    
    int idpersona=Integer.parseInt(request.getParameter("idpersona"));
    Personas persona=null;
    persona=dao.buscarPersonaId(idpersona);

%>       
        
    </head>
    <body>
    <center>
        <div>
            
   <div class="panel panel-primary" style="width: 50%"> 
   <div class="panel-heading"> 
      <h3 class="panel-title">Formulario de Registro Persona</h3> 
   </div> 
   <div class="panel-body"> 

            <form  action="control.jsp" id="formPersona"  class="form-horizontal" role="form" method="post" >
                                    
                <div class="form-group"> 
                   <label for="firstname" class="col-sm-2 control-label">Nombre:</label> 
                   <div class="col-sm-10"> 
                       <input type="text" class="form-control" id="nombre" name="nombre" value="<%=persona.getNombre() %>" required="true" placeholder="Coloque su primer nombre"> 
                   </div> 
                </div>                  
                <div class="form-group"> 
                   <label for="firstname" class="col-sm-2 control-label">A. Paterno:</label> 
                   <div class="col-sm-10"> 
                      <input type="text" class="form-control" id="apellpaterno" name="apellpaterno" value="<%=persona.getApellido_pat() %>" class="txtRegular" required="true" > 
                   </div> 
                </div>                    
                <div class="form-group"> 
                   <label for="firstname" class="col-sm-2 control-label">A. Materno: </label> 
                   <div class="col-sm-10"> 
                      <input type="text" class="form-control"  id="apellmaterno" name="apellmaterno" value="<%=persona.getApellido_mat() %>"  required="true"> 
                   </div> 
                </div>                    
                <div class="form-group"> 
                   <label for="firstname" class="col-sm-2 control-label">F.Nacimiento: </label> 
                   <div class="col-sm-10"> 
                       <input type="date" id="fnacimiento" class="form-control" name="fnacimiento" value="<%=persona.getFecha_nacimiento() %>"> 
                   </div> 
                </div>  
                <div class="form-group"> 
                   <label for="firstname" class="col-sm-2 control-label">Doc. Identidad: </label> 
                   <div class="col-sm-10"> 
                      <select id="docidentidad"  class="form-control input-sm" name="docidentidad" >
                          <% 
                          dao=new PersonaDAO();
                          doc=dao.reportarDocIndentidad();
                          if(doc!=null){
                              for(DocIdentidad to:doc){
                          %>                            
                          <option value="<%=to.getId_doc_identidad() %>" <% if(to.getId_doc_identidad()==persona.getId_docidentidad()){out.print("selected");}  %>  ><%=to.getNombre() %></option>
                           <% } } %>
                        </select> 
                   </div> 
                </div>                 
                <div class="form-group"> 
                   <label for="firstname" class="col-sm-2 control-label">Genero: </label> 
                   <div class="col-sm-10"> 
                      <select id="genero"  class="form-control input-sm" name="genero">
                          <option value="M" <% if((persona.getGenero()).equals("M") ){out.print("selected");}  %>>Masculino</option>
                            <option value="F" <% if((persona.getGenero()).equals("F")){out.print("selected");}  %>>Femenino</option>
                        </select> 
                   </div> 
                </div>                    
                <div class="form-group"> 
                   <label for="firstname" class="col-sm-2 control-label">Correo Elec.: </label> 
                   <div class="col-sm-10"> 
                       <input type="email" id="correo" class="form-control" style="background-color: green; color: #cc0000" name="correo" value="<%=persona.getCorreo() %>" required="true"> 
                   </div> 
                </div>  
                
                <label for="firstname" class="col-sm-2 control-label">Estado: </label> 
                <div>
                    <label class="checkbox-inline">
                    <input type="radio" name="estado" value="1" checked="true">Activo                     
                    </label>
                    <label class="checkbox-inline">
                    <input type="radio" value="0" name="estado"> Desactivo                    
                    </label>                    
                </div> 

                
               <div class="form-group"> 
                   <label for="firstname" class="col-sm-2 control-label">Clave: </label> 
                   <div class="col-sm-10"> 
                       <input type="password" class="form-control" id="clave" name="clave" value="<%=persona.getClave() %>" class="txtRegular" required="true"> 
                   </div> 
                </div> 
                
                
                 <input type="hidden" name="opc" value="M" />
                 <input type="hidden" id="idpersona" value="<%=persona.getId_persona() %>" name="idpersona" >
                 <input type="submit" id="btnCrear" value="Guardar" class="btn btn-primary">                 
                 <input type="reset" id="btnBorrar" value="Limpiar" class="btn btn-success">
                 <input type="button" id="btnCancelar" value="Cancelar" onclick="$(location).attr('href','main.jsp');" class="btn btn-warning">
                 
              
            </form>  
    </div> 
</div>           
             
            
        </div>
    </center>
    </body>
    <%@include file="../../includesFoot.jsp" %>
</html>
