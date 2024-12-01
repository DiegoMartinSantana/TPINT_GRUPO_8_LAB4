<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"></style>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <style>
        body {
            background-color: #f1f5f9;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .card:hover {
            transform: scale(1.005);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
            padding: 10px 20px;
            font-size: 18px;
            transition: background-color 0.3s;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .highlight {
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            padding: 2px 8px;
            font-size: 14px;
        }
        .card-title {
            font-weight: bold;
            color: #333;
        }
        .icon {
            font-size: 20px;
            margin-right: 10px;
            color: #007bff;
        }
    </style>
</head>
<body>
    <%@include file="NavegacionComponenteUsuario.jsp" %>
    
    <div class="container py-5">
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <h5 class="card-title"><i class="fas fa-wallet icon"></i>Selecciona tu Cuenta</h5>
                        <select id="cuentaSelect" class="form-select mt-3" onchange="mostrarHistorial()">
                            <option value="cuenta1">Cuenta 1 - <span class="highlight">$5000</span></option>
                            <option value="cuenta2">Cuenta 2 - <span class="highlight">$3000</span></option>
                        </select>
                    </div>
                </div>
            </div>
          <div class="col-md-8">
    <div class="card h-100">
        <div class="card-body position-relative">
            <h5 class="card-title">
                <i class="fas fa-history icon"></i> Últimas Transferencias 
                <a href="#" class="position-absolute top-0 end-0 me-3 mt-2 text-success" style="font-size: 2rem;" title="Añadir transferencia">
                    <i class="fas fa-plus-circle" style="margin-right:12px"></i>
                </a>
            </h5>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Fecha</th>
                            <th>Monto</th>
                            <th>Destino</th>
                        </tr>
                    </thead>
                    <tbody id="historialTable">
                        <tr>
                            <td>01/10/2023</td>
                            <td>$200</td>
                            <td>Cuenta 2</td>
                        </tr>
                        <tr>
                            <td>02/10/2023</td>
                            <td>$150</td>
                            <td>Cuenta 1</td>
                        </tr>
                        <tr>
                            <td>03/10/2023</td>
                            <td>$300</td>
                            <td>1556595143036</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

        </div>

        

   

</body>
</html>