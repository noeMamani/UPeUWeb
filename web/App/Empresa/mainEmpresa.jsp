<%@page import="java.util.ArrayList"%>
<%@page import="pe.edu.upeu.to.Empresa"%>
<%@page import="pe.edu.upeu.dao.EmpresaDAO"%>
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
        
        EmpresaDAO dao=new EmpresaDAO();
        
        ArrayList<Empresa> data=null;
       
        int i=0;
        if(opc.equals("B")){
            String dato=request.getParameter("dato1");
            data=(ArrayList<Empresa> )dao.buscarPersona(dato);
            
            
        }else{
            data=(ArrayList<Empresa> )dao.reportarEmpresa();
        }               
    %>
    <center>
        <div style="display: normal " id="divFormNew" >
            
            Holas
        </div>
        
        <div>

            <nav class="navbar navbar-default" role="navigation"> 
               <div> 
                  <form class="navbar-form navbar-default" name="formBuscar" action="mainEmpresa.jsp" method="POST"  role="search"> 
                     <div class="form-group"> 
                         Nombre: <input type="text" class="form-control" id="dato1" name="dato1"  placeholder="Buscar"> 
                     </div> 
                     <input type="hidden" name="opc" value="B" />
                     <button type="submit" class="btn btn-default">Buscar</button> 
                     <input type="button" class="btn btn-success" id="btnNuevo1" onclick="$(location).attr('href','FormEmpresa.jsp');" value="Nuevo">
                     <input type="button" class="btn btn-success" id="btnNuevo1" onclick="$(location).attr('href','../Empresa/Main/mainEmpresa2.jsp');" value="Nuevo">
                     <input type="button" class="btn btn-info" id="btnNuevo2" onclick="mostraDiv('divFormNew','btnNuevo2','FormEmpresa.jsp')" value="Nuevo">
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
                <tr class="danger"> <td colspan="7" align="center">Reporte de Empresa</td> </tr>    
            <tr class="danger">                
                <th>#</th>
                <th>Razon Social</th>
                <th>descripcion</th>
                <th>MISION</th>
                <th>VISION </th>
                <th>VALORES</th>
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
            for(Empresa to:data){                           
                %>                
                <tr class="<%if((i%2)==0){out.print("success");}else{ out.print("warning");}%>" >
                    <td><%=++i %>  </td>    
                    <td> <%=to.getRazonsocial() %> </td>                       
                    <td> <%=to.getDescripcion() %> </td>
                    <td> <%=to.getMision() %> </td>
                    <td> <%=to.getVison() %> </td>
                    <td> <%=to.getValores() %> </td>
                    <td> 
                        <a class="btn btn-danger" href="control.jsp?idempresa=<%=to.getId_empresa() %>&dato='Holas'&opc=E ">Eliminar</a>
                        <a class="btn btn-success"  href="FromUEmpresa.jsp?idempresa=<%=to.getId_empresa() %>">Modificar</a>
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
            serviceUrl: '/EmpresaControl',
            onSelect: function (suggestion) {
                alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
            }
        });
        });        
    </script>    
</html>
