<%-- 
    Document   : FormPersona
    Created on : 28-abr-2015, 12:30:27
    Author     : SistemasUpeu
--%>

<%@page import="pe.edu.upeu.to.DocOrganizacion"%>
<%@page import="pe.edu.upeu.to.DocTipo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pe.edu.upeu.dao.EmpresaDAO"%>
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
      <h3 class="panel-title">Formulario de Registro Empresa</h3> 
   </div> 
   <div class="panel-body"> 

            <form  action="Control.jsp" id="formPersona"  class="form-horizontal" role="form" method="post" >
                                    
                <div class="form-group"> 
                   <label for="firstname" class="col-sm-2 control-label">Razon social:</label> 
                   <div class="col-sm-10"> 
                      <input type="text" class="form-control" id="razonsocial" name="razonsocial" required="true" placeholder="razon social"> 
                   </div> 
                </div>                  
                <div class="form-group"> 
                   <label for="firstname" class="col-sm-2 control-label">Descripcion:</label> 
                   <div class="col-sm-10"> 
                      <input type="text" class="form-control" id="descripcion" name="descripcion" class="txtRegular" required="true" > 
                   </div> 
                </div>                    
                <div class="form-group"> 
                   <label for="firstname" class="col-sm-2 control-label">Mision: </label> 
                   <div class="col-sm-10"> 
                      <input type="text" class="form-control"  id="mision" name="mision"  required="true"> 
                   </div> 
                </div>                    
                    <div class="form-group"> 
                   <label for="firstname" class="col-sm-2 control-label">Vision:</label> 
                   <div class="col-sm-10"> 
                      <input type="text" class="form-control" id="vision" name="vision" class="txtRegular" required="true" > 
                   </div> 
                </div>                    
                <div class="form-group"> 
                   <label for="firstname" class="col-sm-2 control-label">Valores </label> 
                   <div class="col-sm-10"> 
                      <input type="text" class="form-control"  id="valores" name="valores"  required="true"> 
                   </div> 
                </div>
                   <div class="form-group"> 
                   <label for="firstname" class="col-sm-2 control-label">Logo</label> 
                   <div class="col-sm-10"> 
                      <input type="text" class="form-control" id="logo" name="logo" class="txtRegular" required="true" > 
                   </div> 
                </div>                    
                <div class="form-group"> 
                   <label for="firstname" class="col-sm-2 control-label">Ruc </label> 
                   <div class="col-sm-10"> 
                      <input type="text" class="form-control"  id="ruc" name="ruc"  required="true"> 
                   </div> 
                </div>
                   <div class="form-group"> 
                   <label for="firstname" class="col-sm-2 control-label">Telefono</label> 
                   <div class="col-sm-10"> 
                      <input type="text" class="form-control" id="telefono" name="telefono" class="txtRegular" required="true" > 
                   </div> 
                </div>                    
                <div class="form-group"> 
                   <label for="firstname" class="col-sm-2 control-label">Celular </label> 
                   <div class="col-sm-10"> 
                      <input type="text" class="form-control"  id="celular" name="celular"  required="true"> 
                   </div> 
                </div>
                                   
                <div class="form-group"> 
                   <label for="firstname" class="col-sm-2 control-label">Correo Elec.: </label> 
                   <div class="col-sm-10"> 
                       <input type="email" id="correo" class="form-control" style="background-color: green; color: #cc0000" name="correo" required="true"> 
                   </div> 
                </div> 
                 
                <div>
                    <label class="checkbox-inline">
                    <input type="radio" name="estado" value="1" checked="true">Activo                     
                    </label>
                    <label class="checkbox-inline">
                    <input type="radio" value="0" name="estado"> Desactivo                    
                    </label>                    
                </div>
                
                
                 
               <div class="col-sm-10"> 
                      <select id="docorganizacion"  class="form-control input-sm" name="docorganizacion">
                          <% 
                          EmpresaDAO dao=null;
                          dao=new EmpresaDAO();
                          ArrayList<DocOrganizacion> doc=null;
                          doc=dao.reportarDocOrganizacion();
                          if(doc!=null){
                              for(DocOrganizacion to:doc){
                          %>                            
                          <option value="<%=to.getId_organizacion()%>"><%=to.getNombre_organizacion()%></option>
                           <% } } %>
                        </select> 
                   </div>
                 <div class="col-sm-10"> 
                      <select id="doctipo"  class="form-control input-sm" name="doctipo">
                          <% 
                          EmpresaDAO daoo=null;
                          dao=new EmpresaDAO();
                          ArrayList<DocTipo> docc=null;
                          docc=dao.reportarDocTipo();
                          if(docc!=null){
                              for(DocTipo to:docc){
                          %>                            
                          <option value="<%=to.getId_tipo()%>"><%=to.getNombre()%></option>
                           <% } } %>
                        </select> 
                   </div>
               
                
                
                 <input type="hidden" name="opc" value="C" />
                 <input type="submit" id="btnCrear" value="Crear" class="btn btn-primary">
                 <input type="reset" id="btnBorrar" value="Limpiar" class="btn btn-success">
                 <input type="button" id="btnCancelar" value="Cancelar" onclick="$(location).attr('href','mainEmpresa.jsp');" class="btn btn-warning">
                 
              
            </form>  
    </div> 
</div>           
             
            
        </div>
    </center>
    </body>
    <%@include file="../../includesFoot.jsp" %>
</html>
