<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> SysCenterLife </title>
    <link href="../Recursos/bootstrap-3.1.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../Recursos/bootstrap-3.1.1-dist/css/bootstrap-theme.min.css" rel="stylesheet">

      <link href="../Recursos/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
      <link href="../Recursos/typehead/typehead.css" rel="stylesheet">

    <!-- http://fortawesome.github.io/Font-Awesome/icons/-->
    <link href="../Recursos/font-awesome-4.2.0/css/font-awesome.min.css" rel="stylesheet">  
    <link href="../Recursos/jasny-bootstrap/css/jasny-bootstrap.css" rel="stylesheet">

    <link href="../Recursos/custom/css/base.css" rel="stylesheet">
    <link href="../Recursos/custom/css/style.css" rel="stylesheet">
    <link href="../Recursos/bootstrap-fileinput/css/fileinput.css" rel="stylesheet">
    <link href="../Recursos/custom/css/navbar-fixed-top.css" rel="stylesheet">

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../Recursos/jquery/jquery.min.js"></script>    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>  
<!-- Fixed navbar inverse default -->
<div class="navbar navbar-inverse navbar-fixed-top" >
  
    
    <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="offcanvas" data-target=".navbar-offcanvas" data-canvas="body">
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <div class='navbar-brand'>
    <ul class="navbar-brand2">
      <li class="dropdown">
        <a href="#" class="dropdown-toggle " data-toggle="dropdown"><i class="fa fa-cloud fa-lg"></i> Corporación-Principal <span class="caret"></span></a>
        <ul class="dropdown-menu" role="menu">
          <li><a href="#">Grupo 1</a></li>
          <li><a href="#">Grupo 2</a></li>
          <li class="divider"></li>
          <li><a href="/accounts/">Elegir sede</a></li>
        </ul>
      </li>
    </ul>
    </div>

  </div>
    
    
  <div class="navbar-offcanvas offcanvas">
    <form class="navbar-form navbar-left form-controlx" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
    </form>
   
    
<ul class="nav navbar-nav">
    <li class="dropdown">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user fa-lg"></i> Adm. Persona<b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li class=""><a href="../App/Persona/FormPersona.jsp" target="home"><i class="fa fa-sitemap "></i> Crear Persona</a>
            </li>
            <li class=""><a href="../App/Persona/main.jsp" target="home"><i class="fa fa-users "></i>Main Persona</a>
            </li>
        </ul>
    </li>
    <li class="dropdown">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user fa-lg"></i> Adm. Empresa<b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li class=""><a href="../App/Empresa/FormEmpresa.jsp" target="home"><i class="fa fa-sitemap "></i> Crear Empresa</a>
            </li>
            <li class=""><a href="../App/Empresa/mainEmpresa.jsp" target="home"><i class="fa fa-users "></i>Main Empresa</a>
            </li>
        </ul>
    </li>


    
</ul>
   
<ul class="nav navbar-nav navbar-right">
  <li class="divider visible-xs"></li>
  <li class="dropdown">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> admin <span class="caret"></span></a>
    <ul class="dropdown-menu" role="menu">
      <li class="divider visible-xs"></li>
      <li><a href="#">Actionx</a></li>
      <li class="divider visible-xs"></li>
      <li><a href="#">Another action</a></li>
      <li class="divider visible-xs"></li>
      <li><a href="/accounts/password/change/">Cambiar contraseña</a></li>
      <li class="divide visible-xs"></li>
      <li class="divider"></li>
      <li><a href="../index.jsp">Salir</a></li>
    </ul>
  </li>
</ul>



  </div><!--/.nav-collapse -->
</div>



<script type="text/javascript">
$(document).ready(function() {
  //url = (window.location.hash.lenth >1) ? window.hash : window.location.pathname;
  //url = url.split('create')[0].split('update')[0];
  $(".dropdown-menu li").each(function(i) {
    //$(this).find('li').each(function(i){
     //if(url==$(this).attr('href')) {
      //alert($(this).attr('class'));
      if( $(this).attr('class')==('active') ) {
      $(this).parent().parent().addClass('active ');//open
      return false;
    }
  //});
});

});
/** Tooltip **/
$(function() { $("[rel=tooltip]").tooltip(); });
</script> 


<div id="shell-load" style="min-height: 800px; height: 100%">
    <iframe  src="home.jsp" width="100%" name="home"  style="min-height: 700px; height: 100%;"  ></iframe>
</div>

<footer class="navbar navbar-inverse navbar-fixed-bottom" style="height: 6%">
    <div class="container">
        <div>
            <p class="visible-xs">&copy; Copyright x2015.</p>
            <p class="visible-xs">Todos los derechos reservados.x</p>
            <p class="hidden-xs">Backengo &copy; 2015 <a href="#"  target="_blank">SysCenterLife</a>. Todos los derechos reservados.</p>
        </div>                
    </div>  
</footer>



  <!-- Le javascript
  ================================================== -->
<script type="text/javascript" src="/jsi18n/"></script>
<script src="../Recursos/bootstrap-3.1.1-dist/js/bootstrap.min.js"></script>
<!-- http://www.jsdelivr.com/#!momentjs http://momentjs.com/timezone/-->
<script src="../Recursos/moment/moment-with-locales.min.js"></script>
<script src="../Recursos/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="../Recursos/typehead/bootstrap.typehead.min.js"></script>  

<script src="../Recursos/jasny-bootstrap/js/jasny-bootstrap.js"></script>
<script src="../Recursos/custom/js/jquery.kumbiaphp.js"></script>
<script src="../Recursos/custom/js/jquery.kgrid.js"></script>

<script src="../Recursos/custom/js/backend.js"></script>
<script src="../Recursos/custom/js/validador.js"></script>
<script src="../Recursos/custom/js/jquery.keyfilter.js"></script>
<script src="../Recursos/bootstrap-fileinput/js/fileinput.js"></script>
</body>
</html>
