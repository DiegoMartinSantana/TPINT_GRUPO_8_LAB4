<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<style>
    .nav-icon {
        font-size: 2.2rem; 
        color: #4a4a4a;
        transition: color 0.3s ease;
    }
    .nav-icon:hover {
        color: #007bff;
    }
    .nav-link {
        margin-right: 20px;
        font-weight: 500;
        color: #495057;
        font-size: 1.1rem; 
        transition: color 0.3s ease;
    }
    .nav-link:hover {
        color: #007bff;
        text-decoration: none;
    }
    .navbar {
        background-color: #ffffff;
        border-bottom: 1px solid #dee2e6;
        padding: 18px 24px; 
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    .navbar-toggler {
        border: 1px solid #adb5bd;
        transition: background-color 0.3s ease;
    }
    .navbar-toggler:hover {
        background-color: #f8f9fa;
    }
    .navbar-toggler-icon {
        filter: invert(30%);
    }
    h5 {
        font-size: 1.2rem; 
        margin-right: 10px;
        margin-top: 5px;
        color: #212529;
        font-weight: 600;
    }
</style>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="HomeServlet">Inicio</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link " aria-current="page" href="Transferencias.jsp">Transferir</a>
        </li>
       
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Prestamos
          </a>
          <ul class="dropdown-menu">

            <li><a class="dropdown-item" href="SolicitudPrestamo.jsp">Solicitar</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="PrestamosUsuario">Historial</a></li>
             <li><hr class="dropdown-divider"></li>
          	 <li><a class="dropdown-item" href="PrestamosUsuario?pagar=<%=true%>">Pagar Prestamos</a></li>
          </ul>
        </li>
        
      </ul>
         <% String usuario = (String) session.getAttribute("UsuarioNombre");
               usuario = usuario.toUpperCase(); %>
               
             
            <div class="d-flex align-items-center">
            
                <h5><%= usuario %></h5>
                <form action="LoginServlet" method="post">
             <button type="submit" class="btn btn-danger">Logout</button>
   			 </form>
                <a class="nav-icon ms-3" href="DatosPersonalesServlet">
                    <i class="bi bi-person-circle"></i>
                </a>
            </div>
     
    </div>
  </div>
</nav>