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

    </style>

<script>

function mostrarOpcionesCuenta() {
    const opcionSeleccionada = document.getElementById("cuentaDestinoOpciones").value;
    const misCuentasField = document.getElementById("misCuentasField");
    const otraCuentaField = document.getElementById("otraCuentaField");

    if (opcionSeleccionada === "misCuentas") {
        misCuentasField.style.display = "block";
        otraCuentaField.style.display = "none";
    } else if (opcionSeleccionada === "otraCuenta") {
        misCuentasField.style.display = "none";
        otraCuentaField.style.display = "block";
    }
}

document.addEventListener("DOMContentLoaded", function () {
    mostrarOpcionesCuenta();
});
</script>


</head>
<body>

  <%@include file="NavegacionComponenteUsuario.jsp" %>

<div class="container" style="margin-top:50px">
   
    <div class="section">
        <h2>Realizar Trasferencia</h2>
        <%  
        	float interes = 2;
            List<Cuenta> cuentas = (List<Cuenta>)request.getSession().getAttribute("Cuentas");
            if (cuentas != null && !cuentas.isEmpty()) {
        %>
        
      
        <form action="servletTrasferencia" method="post">


				<div class="field">
					<label for="cuentaDestinoOpciones">Seleccionar Tipo de
						Cuenta de Depósito:</label> <select id="cuentaDestinoOpciones"
						name="cuentaDestinoOpciones" class="form-select" required
						onchange="mostrarOpcionesCuenta()">
						<option value="misCuentas" selected>Mis Cuentas</option>
						<option value="otraCuenta">Otra Cuenta</option>
					</select>
				</div>

				<div class="field" id="misCuentasField">
					<label for="cuentaDestino">Seleccionar Cuenta:</label> <select
						id="cuentaDestino" name="cuentaDestino" class="form-select">
						<%
							for (Cuenta cuenta : cuentas) {
						%>
						<option value="<%=cuenta.getIdCuenta()%>">
							<%="Cuenta " + cuenta.getIdCuenta() + " - CBU: " + cuenta.getCbu()%>
						</option>
						<%
							}
						%>
					</select>
				</div>

				<div class="field" id="otraCuentaField" style="display: none;">
					<label for="cbuOtro">Ingresar CBU de Otra Cuenta:</label> <input
						type="text" id="cbuOtro" name="cbuOtro" class="form-control"
						placeholder="Ingrese el CBU" pattern="\d{22}">
				</div>


				<!--  
                <select id="interes" name="interes" required onchange="calcularMontoAPagar()">
                    <option value="2">2%</option>
                    <option value="5">5%</option>
                    <option value="7">7%</option>
                    <option value="10">10%</option>
                </select>
                -->

            
            <div class="field">
                <label for="fecha">Fecha de Trasnferencia:</label>
                <input type="date" id="fechaCreacion" name="fechaCreacion" 
                       value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" 
                       readonly>
            </div>


				<div class="field">
					<label for="monto">Monto a Transferir o Depositar:</label> <input
						type="number" id="monto" name="monto" class="form-control"
						placeholder="Ingrese el monto" min="1" required>
				</div>



            <button type="submit">Realizar Transferencia</button>
        </form>
        
        <% } else { %>
            <p>No tienes cuentas para realizar TRANFERENCIA.</p>
        <% } %>
    </div>

    <div class="form-footer">
        
    </div>
</div>

</body>
</html>