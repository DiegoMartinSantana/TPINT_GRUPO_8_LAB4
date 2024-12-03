<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
    .sidebar {
        width: 200px;
        background-color: #2c3e50;
        color: white;
        padding: 20px;
        height: 100vh;
        position: fixed;
    }

    .sidebar h2 {
        color: #ecf0f1;
     
    }

    .sidebar ul {
    margin-top:20px;
        list-style-type: none;
        padding: 0;
     font-size:larger;   
    }

    .sidebar ul li {
    
        margin: 10px 0;
    }

    .sidebar ul li a {
        color: #bdc3c7;
        text-decoration: none;
    }

    .sidebar ul li a:hover {
        color: #ecf0f1;
    }
    button{
    margin-left:10px;
    margin-top:30px;
    	
    	  padding: 0;
    }
    
   
</style>

<aside class="sidebar">
  <h5><%=session.getAttribute("UsuarioNombre") %></h5>
    <ul class="nav flex-column">
     
        <li class="nav-item">
            <a class="nav-link"  data-toggle="collapse" data-target="#clientesSubmenu" aria-expanded="false" aria-controls="clientesSubmenu">
                Clientes
            </a>
            <div id="clientesSubmenu" class="collapse" style="font-size: medium;">
                <ul class="nav flex-column pl-3">
                    <li class="nav-item">
                        <a class="nav-link" href="ClienteServlet">Listado</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ClienteServlet?Alta=<%=1%>">Dar de alta</a>
                    </li>
                  
                </ul>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link"  data-toggle="collapse" data-target="#cuentasSubmenu" aria-expanded="false" aria-controls="cuentasSubmenu">
                Cuentas
            </a>
            <div id="cuentasSubmenu" class="collapse" style="font-size: medium;">
                <ul class="nav flex-column pl-3">
                    <li class="nav-item">
                        <a class="nav-link" href="CuentaServlet">Listado</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AltaCuentaServlet">Crear</a>
                    </li>
                    
                </ul>
            </div>
        </li>
        
        <li class="nav-item">
            <a class="nav-link" href="PrestamosServlet">Préstamos</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="InformesServlet">Informes</a>
        </li>
       
    </ul>
    <form action="LoginServlet" method="post">
             <button type="submit" class="btn btn-danger">Logout</button>
    </form>
    
    
</aside>