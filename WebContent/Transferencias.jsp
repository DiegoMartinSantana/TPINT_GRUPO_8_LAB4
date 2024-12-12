<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="Dominio.Cuenta" %> 
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Pedido de Préstamo</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        
        .container {
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .section {
            margin-bottom: 20px;
        }

        h2 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }

        .field {
            margin-bottom: 20px;
        }

        label {
            font-size: 14px;
            color: #555;
            display: block;
            margin-bottom: 8px;
        }

        input, select, button {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        input[type="date"] {
            width: auto;
            display: inline-block;
        }

        button {
            background-color: #5cb85c;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #4cae4c;
        }

        .form-footer {
            text-align: center;
            margin-top: 20px;
        }

        .form-footer p {
            color: #888;
        }
        
       .field input[type="date"],
       .field input[type="text"] {
        width: 100%; 
        padding: 12px; 
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 14px;
        box-sizing: border-box; 
    }
    input[readonly] {
    background-color: #f0f0f0; 
    color: #333;
    border: 1px solid #ddd;
    cursor: not-allowed; 
}

    </style>

<script>

function validarTransferencia() {
    var tipoSeleccionado = document.getElementById('cuentaDestinoOpciones').value;
    var monto = parseFloat(document.getElementById('monto').value);
    
    if (monto <= 0) {
        alert('El monto debe ser mayor a 0');
        return false;
    }
    
    if (tipoSeleccionado === 'otraCuenta') {
        var cbuOtro = document.getElementById('cbuOtro').value;
        if (cbuOtro.length !== 22 ) {
            alert('El CBU debe contener 22 dígitos numéricos');
            return false;
        }
    }
    
    return true;
}

document.addEventListener('DOMContentLoaded', mostrarOpcionesCuenta);
});
</script>


</head>
<body>

  <%@include file="NavegacionComponenteUsuario.jsp" %>

<div class="container" style="margin-top:50px">
    <div class="section">
        <h2>Realizar Transferencia</h2>
        
        <%
        float interes = 2;
        List<Cuenta> cuentas = (List<Cuenta>) request.getSession().getAttribute("Cuentas");
        String mensaje = (String) request.getAttribute("mensaje");
        String tipoMensaje = (String) request.getAttribute("tipoMensaje");
        %>
        
        <% if (cuentas != null && !cuentas.isEmpty()) { %>
            <!-- Mostrar mensajes de error o éxito -->
            <% if (mensaje != null && !mensaje.isEmpty()) { %>
                <div class="alert alert-<%= tipoMensaje %>" role="alert">
                    <%= mensaje %>
                </div>
            <% } %>
        
            <form action="servletTransferencia" method="post" onsubmit="return validarTransferencia()">
                <div class="row">
                    <!-- Selección de cuenta origen -->
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="id_cuenta_origen" class="form-label">Cuenta de Origen:</label>
                            <select name="id_cuenta_origen" class="form-select">
                                <% for (Cuenta cuenta : cuentas) { 
                                    String tipoCuenta = "";
                                    if (cuenta.getTipo() == 1) {
                                        tipoCuenta = "Caja de Ahorro";
                                    } else if (cuenta.getTipo() == 2) {
                                        tipoCuenta = "Cuenta Corriente";
                                    }
                                %>
                                    <option value="<%= cuenta.getIdCuenta() %>">
                                        <%= tipoCuenta %> - CBU: <%= cuenta.getCbu() %>
                                    </option>
                                <% } %>
                            </select>
                        </div>
                    </div>
                    
                    <!-- Selección entre Mis Cuentas u Otra Cuenta -->
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="cuentaDestinoOpciones" class="form-label">Destinatario:</label>
                            <select id="cuentaDestinoOpciones" name="cuentaDestinoOpciones" 
                                    class="form-select" required onchange="mostrarOpcionesCuenta()">
                                <option value="misCuentas" selected>Mis Cuentas</option>
                                <option value="otraCuenta">Otra Cuenta</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Campos dinámicos -->
                <div class="row">
                    <div class="col-md-6" id="misCuentasField">
                        <div class="mb-3">
                            <label for="id_cuenta_destino" class="form-label">Seleccionar Cuenta:</label>
                            <select name="id_cuenta_destino" class="form-select">
                                <% for (Cuenta cuenta : cuentas) { 
                                    String tipoCuenta = "";
                                    if (cuenta.getTipo() == 1) {
                                        tipoCuenta = "Caja de Ahorro";
                                    } else if (cuenta.getTipo() == 2) {
                                        tipoCuenta = "Cuenta Corriente";
                                    }
                                %>
                                    <option value="<%= cuenta.getIdCuenta() %>">
                                        <%= tipoCuenta %> - CBU: <%= cuenta.getCbu() %>
                                    </option>
                                <% } %>
                            </select>
                            <% if (request.getSession().getAttribute("MismasCuentas") != null) { %>
                            <p style="color:red">Seleccione una cuenta distinta a la de origen.</p>
                            <% } %>
                        </div>
                    </div>

                    <div class="col-md-6" id="otraCuentaField" style="display: none;">
                        <div class="mb-3">
                            <label for="cbuOtro" class="form-label">Ingresar CBU de Otra Cuenta:</label>
                            <input type="text" id="cbuOtro" name="cbuOtro" 
                                   class="form-control" placeholder="Ingrese el CBU" 
                                   pattern="\d{22}" maxlength="22" minlength="22">
                        </div>
                    </div>
                </div>

                <!-- Fecha, monto y detalle -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="fechaCreacion" class="form-label">Fecha de Transferencia:</label>
                            <input type="date" id="fechaCreacion" name="fechaCreacion"
                                   value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>"
                                   class="form-control" readonly>
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="importe" class="form-label">Monto a Transferir:</label>
                            <input type="number" name="importe" 
                                   class="form-control" placeholder="Ingrese el monto" 
                                   min="1" step="0.01" required>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="mb-3">
                            <label for="detalle" class="form-label">Detalle de la Transferencia:</label>
                            <select id="detalle" name="detalle" class="form-select" required>
                                <option value="Pago de servicios">Pago de servicios</option>
                                <option value="Transferencia familiar">Transferencia familiar</option>
                                <option value="Inversión">Inversión</option>
                                <option value="Otro">Otro</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <input type="submit" class="btn btn-primary w-100" name="btnTransferencia" value="Realizar Transferencia">
                </div>
            </form>
        <% } else { %>
            <div class="alert alert-warning">
                No tienes cuentas para realizar TRANSFERENCIA.
            </div>
        <% } %>
    </div>
</div>

<script>
    function mostrarOpcionesCuenta() {
        const opcion = document.getElementById("cuentaDestinoOpciones").value;
        const misCuentasField = document.getElementById("misCuentasField");
        const otraCuentaField = document.getElementById("otraCuentaField");

        if (opcion === "misCuentas") {
            misCuentasField.style.display = "block";
            otraCuentaField.style.display = "none";
        } else if (opcion === "otraCuenta") {
            misCuentasField.style.display = "none";
            otraCuentaField.style.display = "block";
        }
    }
</script>
</body>
</html>