<%-- 
    Document   : index
    Created on : 10/04/2015, 12:23:37 AM
    Author     : Intel
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="pe.edu.upeu.to.Personas"%>
<%@page import="pe.edu.upeu.dao.PersonaDAO"%>
<%@page import="pe.edu.upeu.util.DBconn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>UPeU</title>   
        <%@include file="../../includesHead.jsp" %>
        
        <script type="text/javascript" src="../../Recursos/js/jslp1.js"></script>
        
        
        
        <script type="text/javascript">            
            $(document).ready(function(){  
                
            $('#myTable').pageMe({pagerSelector:'#myPager',showPrevNext:true,hidePageNumbers:false,perPage:4});
            

            });
            
            function mostraDiv(nombreDiv, btn, url){
                
                $.ajax({url: url, success: function(result){  
                        //alert(result);
                    $('#'+nombreDiv).show('slow');//btnBuscar 
                    //$('#'divFormNew).show('slow');//btnBuscar 
                    $('#'+btn).hide('slow');//para ocultar              
                    $('#'+nombreDiv).html(result); //Colocar el Formulario de la pagina                                              
                }});                

            }            
        </script>
    </head>
    <body>
    <%
        String opc=request.getParameter("opc")==null ? "":request.getParameter("opc");
        
        PersonaDAO dao=new PersonaDAO();
        
        ArrayList<Personas> data=null;
       
        int i=0;
        if(opc.equals("B")){
            String dato=request.getParameter("dato1");
            data=(ArrayList<Personas> )dao.buscarPersona(dato);
            
            
        }else{
            data=(ArrayList<Personas> )dao.reportarPersonasDos();
        }               
    %>
    <center>
        <div style="display: normal " id="divFormNew" >
            
            Holas
        </div>
        
        <div>

            <nav class="navbar navbar-default" role="navigation"> 
               <div> 
                  <form class="navbar-form navbar-default" name="formBuscar" action="main.jsp" method="POST"  role="search"> 
                     <div class="form-group"> 
                         Nombre: <input type="text" class="form-control" id="dato1" name="dato1"  placeholder="Buscar"> 
                     </div> 
                     <input type="hidden" name="opc" value="B" />
                     <button type="submit" class="btn btn-default">Buscar</button> 
                     <input type="button" class="btn btn-success" id="btnNuevo1" onclick="$(location).attr('href','FormPersona.jsp');" value="Nuevo">
                     <input type="button" class="btn btn-success" id="btnNuevo1" onclick="$(location).attr('href','../Empresa/Main/mainEmpresa2.jsp');" value="Nuevo">
                     <input type="button" class="btn btn-info" id="btnNuevo2" onclick="mostraDiv('divFormNew','btnNuevo2','FormPersona.jsp')" value="Nuevo">
                      <input type="button" class="btn btn-info" id="btnNuevo3" onclick="mostraDiv('divFormNew','btnNuevo3','../Empresa/Main/mainEmpresa2.jsp')" value="Nuevo2">
                  </form>     
               </div> 
            </nav>            
        </div>
        <div class="container">
        <div class="row">
        <div class="table-responsive">
        <table  class="table table-bordered"> 
            <thead style="background-color: aquamarine">
                <tr class="danger"> <td colspan="7" align="center">Reporte de Personas</td> </tr>    
            <tr class="danger">                
                <th>#</th>
                <th>Nombre</th>
                <th>A. Paterno </th>
                <th>A. Materno </th>
                <th>F. Nacimiento </th>
                <th>Usuario</th>
                <th>Opciones</th>
            </tr>
            </thead>
            <tbody id="myTable">
        <%
            /*
            comentario            
            */                        

            try{
            if(data.size()==0){
            %>
            <tr><td colspan="7"> No existe Registro </td> </tr>
            <%
            }else{
            for(Personas to:data){                           
                %>                
                <tr class="<%if((i%2)==0){out.print("success");}else{ out.print("warning");}%>" >
                    <td><%=++i %>  </td>    
                    <td> <%=to.getNombre() %> </td>                       
                    <td> <%=to.getApellido_pat() %> </td>
                    <td> <%=to.getApellido_mat() %> </td>
                    <td> <%=to.getFecha_nacimiento() %> </td>
                    <td> <%=to.getUsuario() %> </td>
                    <td> 
                        <a class="btn btn-danger" href="control.jsp?idpersona=<%=to.getId_persona() %>&dato='Holas'&opc=E ">Eliminar</a>
                        <a class="btn btn-success"  href="FormUPerona.jsp?idpersona=<%=to.getId_persona() %>">Modificar</a>
                    </td>
                </tr>                                
            <%
            }}
            }catch(Exception e){ out.print(e.getMessage());}                        
        %>
            </tbody>
            
        </table>    
        </div>
      <div class="col-md-12 text-center">
      <ul class="pagination pagination-lg pager" id="myPager"></ul>            
        </div>
        </div>
        </center>
    </body>

    <%@include file="../../includesFoot.jsp" %>
    <script type="text/javascript">
        $(document).ready(function(){
        $('#dato1').autocomplete({
            serviceUrl: '/PersonaControl',
            onSelect: function (suggestion) {
                alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
            }
        });
        });        
    </script>    
</html>
