<%-- 
    Document   : FormPersona
    Created on : 28-abr-2015, 12:30:27
    Author     : SistemasUpeu
--%>

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
                      <input type="text" class="form-control" id="nombre" name="nombre" required="true" placeholder="Coloque su primer nombre"> 
                   </div> 
                </div>                  
                <div class="form-group"> 
                   <label for="firstname" class="col-sm-2 control-label">A. Paterno:</label> 
                   <div class="col-sm-10"> 
                      <input type="text" class="form-control" id="apellpaterno" name="apellpaterno" class="txtRegular" required="true" > 
                   </div> 
                </div>                    
                <div class="form-group"> 
                   <label for="firstname" class="col-sm-2 control-label">A. Materno: </label> 
                   <div class="col-sm-10"> 
                      <input type="text" class="form-control"  id="apellmaterno" name="apellmaterno"  required="true"> 
                   </div> 
                </div>                    
                <div class="form-group"> 
                   <label for="firstname" class="col-sm-2 control-label">F.Nacimiento: </label> 
                   <div class="col-sm-10"> 
                       <input type="date" id="fnacimiento" class="form-control" name="fnacimiento"> 
                   </div> 
                </div>  
                 <div class="col-sm-10"> 
                      <select id="docidentidad"  class="form-control input-sm" name="docidentidad">
                          <% 
                          PersonaDAO dao=null;
                          dao=new PersonaDAO();
                          ArrayList<DocIdentidad> doc=null;
                          doc=dao.reportarDocIndentidad();
                          if(doc!=null){
                              for(DocIdentidad to:doc){
                          %>                            
                          <option value="<%=to.getId_doc_identidad() %>"><%=to.getNombre() %></option>
                           <% } } %>
                        </select> 
                   </div> 
                            
                <div class="form-group"> 
                   <label for="firstname" class="col-sm-2 control-label">Genero: </label> 
                   <div class="col-sm-10"> 
                      <select id="genero"  class="form-control input-sm" name="genero">
                            <option value="M">Masculi]o</option>
                            <option value="F">Femenino</option>
                        </select> 
                   </div> 
                </div>                    
                <div class="form-group"> 
                   <label for="firstname" class="col-sm-2 control-label">Correo Elec.: </label> 
                   <div class="col-sm-10"> 
                       <input type="email" id="correo" class="form-control" style="background-color: green; color: #cc0000" name="correo" required="true"> 
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
                   <label for="firstname" class="col-sm-2 control-label">Usuario: </label> 
                   <div class="col-sm-10"> 
                       <input type="text" class="form-control" id="usuario" name="usuario" class="txtRegular" required="true"> 
                   </div> 
                </div> 
                
               <div class="form-group"> 
                   <label for="firstname" class="col-sm-2 control-label">Clave: </label> 
                   <div class="col-sm-10"> 
                       <input type="password" class="form-control" id="clave" name="clave" class="txtRegular" required="true"> 
                   </div> 
                </div> 
                
                
                 <input type="hidden" name="opc" value="C" />
                 <input type="submit" id="btnCrear" value="Crear" class="btn btn-primary">
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
