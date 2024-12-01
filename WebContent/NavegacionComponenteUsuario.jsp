<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<style>
    .nav-icon {
        font-size: 3rem; 
    }
    .nav-link {
        margin-right: 20px;
    }
</style>

<div class="row" style="font-size: x-large;">
    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 16px;">
        <div class="container-fluid">
          

          
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

           
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item me-3">
                        <a class="nav-link active" aria-current="page" href="Home.jsp">Inicio</a>
                    </li>
                    <li class="nav-item me-3">
                        <a class="nav-link" href="ListarCuenta.jsp">Cuentas</a>
                    </li>
                    <li class="nav-item me-3">
                        <a class="nav-link" href="Transferencias.jsp">Transferencias</a>
                    </li>
                    <li class="nav-item me-3">
                        <a class="nav-link" href="SolicitudPrestamo.jsp">Préstamos</a>
                    </li>
                </ul>
            </div>
            <%String usuario = (String)session.getAttribute("UsuarioNombre");
            usuario = usuario.toUpperCase();%>
  <h5 style="margin-right:10px;margin-top:5px"><%=usuario %></h5>

            <a class="nav-link ms-auto" href="DatosPersonalesServlet">
                <i class="bi-person-circle "></i>
            </a>
        </div>
    </nav>
</div>