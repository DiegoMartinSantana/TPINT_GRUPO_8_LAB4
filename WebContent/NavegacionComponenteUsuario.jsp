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

<div class="row">
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <!-- Toggle Button for Mobile View -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navbar Links -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="HomeServlet">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ListarCuenta.jsp">Cuentas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Transferencias.jsp">Transferencias</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="SolicitudPrestamo.jsp">Préstamos</a>
                    </li>
                </ul>
            </div>

            <!-- User Information -->
            <% String usuario = (String) session.getAttribute("UsuarioNombre");
               usuario = usuario.toUpperCase(); %>
            <div class="d-flex align-items-center">
                <h5><%= usuario %></h5>
                <a class="nav-icon ms-3" href="DatosPersonalesServlet">
                    <i class="bi bi-person-circle"></i>
                </a>
            </div>
        </div>
    </nav>
</div>

